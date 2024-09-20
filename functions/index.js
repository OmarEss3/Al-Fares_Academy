// function sendEmail() {
//   emailjs.send("service_fdufkbw", "template_tdu9fa8", {
//     user_email: "omaresam0000@gmail.com",  // Your email
//     admin_email: "omaresam2323@gmail.com"  // Admin email
//   }, "your_emailjs_user_id")
//   .then((response) => {
//     console.log('Email sent successfully!', response.status, response.text);
//   }, (error) => {
//     console.error('Failed to send email:', error);
//   });
// }
const functions = require('firebase-functions');
const express = require('express');
const prerender = require('prerender-node');

const app = express();

// Set up Prerender.io middleware
app.use(prerender.set('prerenderToken', 'k7b5KJtR4J883Zp4SIIF'));

app.use(express.static(__dirname + '/../build/web'));

exports.prerender = functions.https.onRequest(app);
