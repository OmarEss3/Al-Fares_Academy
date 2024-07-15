
import 'package:flutter/material.dart';

class FreeClassButton extends StatelessWidget {
  const FreeClassButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xff006464),
        ),
        height: 40,
        width: 200,
        child: const Center(
          child: Text(
            'Get a free class',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white,),
          ),
        ),
      ),
    );
  }
}
