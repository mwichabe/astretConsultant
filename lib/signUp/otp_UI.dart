import 'package:astret/colors/colors.dart';
import 'package:astret/home/home.dart';
import 'package:astret/login/logIn.dart';
import 'package:flutter/material.dart';

class OtpUI extends StatelessWidget {
  const OtpUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
            child: Image.asset(
              'assets/Untitled.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            'A digit code was sent to your email',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const Text(
            'Didn\'t receive code?',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Container(
              width: 378,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(0),
                ),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Your code',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              child: Text(
                'Validate',
                style: TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Go back to Sign In'),
                const SizedBox(
                  width: 5.0,
                ),
                GestureDetector(
                  //will be implemented soon
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen1()));
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    ));
  }
}
