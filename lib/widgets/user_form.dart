import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../Services/fire_base.dart';
import '../constants/colors.dart';
import '../constants/lists.dart';
import 'drop_down.dart';
import 'text_field.dart';

class UserForm extends StatefulWidget {
  final bool freeClssTxt;

  const UserForm({super.key, required this.freeClssTxt});

  @override
  UserFormState createState() => UserFormState();
}

class UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseService _firebaseService = FirebaseService();
  bool _isLoading = false;
  String? _name, _email, _age, _gender, _program;
  String? phone; // Define phone as a class member
  final List<String> _genders = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextField(
                    label: 'Name',
                    onSaved: (value) => _name = value,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter your name'
                        : null,
                  ),
                  const SizedBox(height: 16.0),
                  buildTextField(
                    label: 'Email',
                    onSaved: (value) => _email = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16.0),
                  buildPhoneNumberField(),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: buildTextField(
                          label: 'Age',
                          onSaved: (value) => _age = value,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your age'
                              : null,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        flex: 1,
                        child: buildDropdown(
                          label: 'Gender',
                          items: _genders,
                          value: _gender,
                          onChanged: (value) => setState(() => _gender = value),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please select your gender'
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  buildDropdown(
                    label: 'Program',
                    items: programs,
                    value: _program,
                    onChanged: (value) => setState(() => _program = value),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please select a program'
                        : null,
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        backgroundColor: kPrimaryColorDarkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : const Text(
                              'Submit',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          widget.freeClssTxt
              ? Flexible(
                  flex: 2,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TryFreeClassText(text: 'Try'),
                            TryFreeClassText(text: ' a '),
                            TryFreeClassText(text: 'Free '),
                            TryFreeClassText(text: 'Class'),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget buildPhoneNumberField() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Phone',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColorDarkBlue),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColorDarkBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColorDarkBlue),
        ),
      ),
      initialCountryCode: 'US',
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ], // Only numbers allowed
      onCountryChanged: (country) {
        log('Country changed to: ${country.name}');
      },
      onSaved: (phoneNumber) => phone = phoneNumber?.completeNumber,
      validator: (phoneNumber) {
        if (phoneNumber == null || phoneNumber.completeNumber.isEmpty) {
          return 'Please enter your phone number';
        }
        return null;
      },
    );
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      setState(() {
        _isLoading = true;
      });

      log('Form validated and saved. Checking if user exists...');

      try {
        bool userExists =
            await _firebaseService.checkUserExists(_email!, phone!);
        if (_name == null ||
            _email == null ||
            phone == null ||
            _age == null ||
            _gender == null ||
            _program == null) {
          log('Error: One or more fields are empty.');
          return; // Exit the function early if any field is empty
        }

        if (userExists) {
          print('User already exists.');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User already exists!')),
          );
        } else {
          log('Saving user data...');
          await _firebaseService.saveUserData(context, {
            'name': _name,
            'email': _email,
            'phone': phone,
            'age': _age,
            'gender': _gender,
            'program': _program,
          });
          log('User data saved successfully.');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User data submitted successfully!')),
          );
          _formKey.currentState?.reset();
        }
      } catch (e) {
        log('Error occurred: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}

class TryFreeClassText extends StatelessWidget {
  const TryFreeClassText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 80,
        fontWeight: FontWeight.bold,
        color: kPrimaryColorDarkBlue,
      ),
    );
  }
}
