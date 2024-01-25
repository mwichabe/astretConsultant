import 'package:astret/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Why Us',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
      content: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Hello, by engaging with us you will be able to gain the following benefits:\n\n'
          'a. Free learning materials.\n'
          'b. Service delivered that operates for 24 hours.\n'
          'c. Expert Tutorials\n'
          'd. Quality Services at flexible and affordable charges.\n\n'
          'NB: Study materials will be shared upon scheduling',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'OK',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
