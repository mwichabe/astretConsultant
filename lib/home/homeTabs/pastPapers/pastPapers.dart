import 'package:astret/colors/colors.dart';
import 'package:astret/home/homeTabs/pastPapers/pastPaperWidgets/pastPaperWidget.dart';
import 'package:astret/home/homeTabs/pastPapers/pastpapes/phd/msc/mba/mba.dart';
import 'package:astret/home/homeTabs/pastPapers/pastpapes/phd/msc/mba/mppa/mppa.dart';
import 'package:astret/home/homeTabs/pastPapers/pastpapes/phd/msc/msc.dart';
import 'package:astret/home/homeTabs/pastPapers/pastpapes/phd/phd.dart';
import 'package:flutter/material.dart';

class PastPapers extends StatelessWidget {
  const PastPapers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          color: AppColor.secondaryColor,
          child: Column(
            children: [
              PastPaperCard(
                  pastPaperName: 'PhD',
                  whenPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PhD()));
                  }),
              PastPaperCard(
                  pastPaperName: 'Msc',
                  whenPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Msc()));
                  }),
              PastPaperCard(
                  pastPaperName: 'MBA',
                  whenPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MBA()));
                  }),
              PastPaperCard(
                  pastPaperName: 'MPPA',
                  whenPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MPPA()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
