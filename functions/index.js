const functions = require('firebase-functions');
const admin = require('firebase-admin');
const sgMail = require('@sendgrid/mail');

admin.initializeApp();
sgMail.setApiKey('YOUR_SENDGRID_API_KEY');  // Replace with your actual SendGrid API key

exports.makeUppercase = functions.firestore.document('/messages/{documentId}')
.onCreate((snap, context) => {
  const original = snap.data().original;
  console.log('Uppercasing', context.params.documentId, original);
  const uppercase = original.toUpperCase();
  return snap.ref.set({uppercase}, {merge: true});
});

exports.sendEmailNotification = functions.firestore
    .document('users/{userId}')
    .onCreate((snap, context) => {
        const newValue = snap.data();
        const msg = {
            to: 'omaresam2323@gmail.com', // Change to your recipient
            from: 'moyeserclients@gmail.com', // Change to your verified sender
            subject: 'New Form Submission',
            text: `A new form has been submitted with the following details: ${JSON.stringify(newValue)}`,
        };

        return sgMail.send(msg);
    });
