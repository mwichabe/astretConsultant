import 'dart:developer';

import 'package:astret/colors/colors.dart';
import 'package:astret/home/home.dart';
import 'package:astret/signUp/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen1 extends StatefulWidget {
  final Color? primaryColor;
  final Color? backgroundColor;
  final AssetImage backgroundImage;

  const LoginScreen1({
    super.key,
    this.primaryColor = Colors.green,
    this.backgroundColor = Colors.white,
    this.backgroundImage =
        const AssetImage("assets/singInBackground/full-bloom.png"),
  });

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  bool isLoading = false;
  bool isCheckedRememberMe = false;
  final _formKey = GlobalKey<FormState>();
  //firebase
  final _auth = FirebaseAuth.instance;
  //form key
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: [
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
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/logIn.jpg',
                                fit: BoxFit.cover,
                                width: 80.0,
                                height: 80.0,
                              ),
                            ),
                          ],
                        )),
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
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('Email field is required');
                            }
                            //regEx for email
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid  email");
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
                    "Password",
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
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "LOGIN",
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
                                      signIn(_emailController.text,
                                          _passwordController.text)
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          onPressed: () => {
                            signIn(
                                _emailController.text, _passwordController.text)
                          },
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
                                "CREATE ACCOUNT",
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
                                    builder: (context) => const SignUp()))
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
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        // Check if user is not null
        if (user != null) {
          // Navigate to the home screen after successful sign-in
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );

          // Show success message
          Fluttertoast.showToast(
            msg: 'Sign in with Google successful',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            timeInSecForIosWeb: 1,
            fontSize: 16,
          );
        }
      }
    } catch (error) {
      // Handle sign-in error
      log(error.toString());

      // Show error message
      Fluttertoast.showToast(
        msg: 'Sign in with Google failed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        timeInSecForIosWeb: 1,
        fontSize: 16,
      );
    }
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        // Perform sign-in
        var userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        setState(() {
          isLoading = false;
        });

        // Navigate to home screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));

        // Show success message
        Fluttertoast.showToast(
          msg: 'Login Successful',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          timeInSecForIosWeb: 1,
          fontSize: 16,
        );
      } catch (e) {
        log(e.toString());

        setState(() {
          isLoading = false;
        });

        // Show error message
        String errorMessage = 'An error occurred during sign-in.';
        if (e is FirebaseAuthException) {
          switch (e.code) {
            case 'invalid-email':
              errorMessage = 'Invalid email address.';
              break;
            case 'user-not-found':
              errorMessage = 'User not found. Please check your credentials.';
              break;
            case 'wrong-password':
              errorMessage =
                  'Invalid password. Please check your password and try again.';
              break;
            // Add more cases for other possible error codes
            default:
              errorMessage =
                  'An error occurred during sign-in. Please try again later.';
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
      }
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
