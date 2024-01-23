import 'package:astret/colors/loaders.dart';
import 'package:flutter/material.dart';

class Msc extends StatelessWidget {
  const Msc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MSC'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(child: ColorLoader5()),
      ),
    );
  }
}
