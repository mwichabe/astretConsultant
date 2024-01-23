import 'package:astret/colors/colors.dart';
import 'package:flutter/material.dart';

class PastPaperList extends StatelessWidget {
  final String title;
  final VoidCallback paperTapped;
  const PastPaperList(
      {super.key, required this.title, required this.paperTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: paperTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: AppColor.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
