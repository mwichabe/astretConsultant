import 'dart:developer';

import 'package:astret/home/home.dart';
import 'package:astret/login/logIn.dart';
import 'package:astret/models/user.dart';
import 'package:astret/signUp/otp_UI.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignUp extends StatefulWidget {
  final Color? primaryColor;
  final Color? backgroundColor;
  final AssetImage backgroundImage;
  const SignUp({
    super.key,
    this.primaryColor = Colors.green,
    this.backgroundColor = Colors.white,
    this.backgroundImage =
        const AssetImage("assets/singInBackground/full-bloom.png"),
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;
  final _auth = FirebaseAuth.instance;
  //form key
  final _formKey = GlobalKey<FormState>();
  //editing Controllers
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: widget.backgroundImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment: Alignment.center,
                        padding:
                            const EdgeInsets.only(top: 100.0, bottom: 100.0),
                        child: const Text('Sign Up')),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Full Name",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                        margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                      ),
                      Expanded(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _nameEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your name',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Email",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                        margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                      ),
                      Expanded(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _emailEditingController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email address',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('Email field is required');
                            }
                            //regEx for email
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Phone Number",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Icon(
                          Icons.phone_android_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                        margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: phoneEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your Phone Number',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone number is required';
                            }

                            // Regex for a phone number with a country code (e.g., +1234567890)
                            if (!RegExp(r'^\+[1-9]\d{0,14}$').hasMatch(value)) {
                              return 'Please enter a valid phone number with a country code';
                            }

                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Password  ",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Icon(
                          Icons.lock_open,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                        margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                      ),
                      Expanded(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _passwordEditingController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your Password ',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            RegExp regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!$@#&*~]).{6,}$');
                            if (value!.isEmpty) {
                              return ('Password field cannot be null');
                            }
                            //regEx for password field
                            if (!regex.hasMatch(value)) {
                              return ('Password should: \n'
                                  ' Have at least 6 characters\n '
                                  'Have a symbol \n'
                                  'Have an uppercase \n'
                                  'Have a numeric number \n'
                                  'eg. Astret@1');
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            backgroundColor: widget.primaryColor,
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "SIGNUP",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Transform.translate(
                                offset: const Offset(15.0, 0.0),
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28.0)),
                                      //splashColor: Colors.white,
                                      backgroundColor: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: widget.primaryColor,
                                    ),
                                    onPressed: () => {
                                      register(_emailEditingController.text,
                                          _passwordEditingController.text)
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          onPressed: () => {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            backgroundColor: Colors.transparent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              alignment: Alignment.center,
                              child: Text(
                                "LOG IN",
                                style: TextStyle(
                                    color: widget.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onPressed: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen1()))
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  postDetailsToFirestore() async {
    // calling firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    //calling usermodel
    UserModelOne userModel = UserModelOne(uid: '');
    // sending content
    userModel.email = user!.email;
    userModel.uid = user.uid;
    //userModel.phoneNumber= _phoneNumberController.text as int?;
    userModel.yourName = _nameEditingController.text;
    userModel.phoneNumber = phoneEditingController.text;
    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()
            //OtpUI()
            ));
    Fluttertoast.showToast(
      msg: 'Account created successfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      timeInSecForIosWeb: 1,
      fontSize: 16,
    );
  }

  void register(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        await _auth.createUserWithEmailAndPassword(
          email: _emailEditingController.text,
          password: _passwordEditingController.text,
        );

        // If the user creation is successful, post details to Firestore
        await postDetailsToFirestore();
      } catch (e) {
        log(e.toString());
        // Show error message
        String errorMessage = 'An error occurred during sign-up.';
        if (e is FirebaseAuthException) {
          switch (e.code) {
            case 'weak-password':
              errorMessage =
                  'The password is too weak. Please use a stronger password.';
              break;
            case 'email-already-in-use':
              errorMessage =
                  'The email address is already in use. Please choose a different email.';
              break;
            // Add more cases for other possible error codes
            default:
              errorMessage =
                  'An error occurred while creating your account. Please try again later.';
          }
        }
        Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          timeInSecForIosWeb: 1,
          fontSize: 16,
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> _signUpWithGoogle() async {
    try {
      // Trigger the Google Sign In flow.
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Obtain the GoogleSignInAuthentication object.
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        // Create a new credential.
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Sign in to Firebase with the Google credentials.
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);

        // Get the user object from the auth result.
        final User? user = authResult.user;

        if (user != null) {
          // Extract user's email and name from the Google user profile.
          final String? userEmail = user.email;
          final String? userName = user.displayName;
          final String? userPhone = user.phoneNumber;
          final String? userImage = user.photoURL;

          // Save user data to Firestore.
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'yourName': userName,
            'email': userEmail,
            'phoneNumber': userPhone,
            'profilePictureUrl': userImage
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );

          // Show success message
          Fluttertoast.showToast(
            msg: 'Sign up with Google successful',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            timeInSecForIosWeb: 1,
            fontSize: 16,
          );
        }
      }
    } catch (error) {
      // Handle sign-up errors.
      print('Error signing up with Google: $error');

      // Show error message
      Fluttertoast.showToast(
        msg: 'Sign up with Google failed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        timeInSecForIosWeb: 1,
        fontSize: 16,
      );
    }
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
