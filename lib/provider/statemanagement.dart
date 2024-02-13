import 'package:astret/colors/loaders.dart';
import 'package:astret/home/home.dart';
import 'package:astret/signUp/signUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StateManager extends StatelessWidget {
  const StateManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: ColorLoader5(),
            );
          } else if (snapshot.hasData) {
            final currentUser = FirebaseAuth.instance.currentUser!;
            final userRef = FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser.uid);
            return FutureBuilder<DocumentSnapshot>(
                future: userRef.get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: ColorLoader5());
                  } else if (snapshot.hasData) {
                    return Home();
                  } else {
                    return const Text('Error occurred');
                  }
                });
          } else {
            return SignUp();
          }
        },
      ),
    );
  }
}
