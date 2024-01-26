import 'package:astret/colors/loaders.dart';
import 'package:astret/home/homeTabs/pastPapers/pastPaperWidgets/paperTile.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                PaperTile(
                    paperTile: 'BAC 816: Theory of Finance', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 839: Applied Statistics', onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 820: Managerial Economics',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 817: Financial Intermediation',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 818: Financial Econometrics',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 819: Financial Analysis', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 820: Intermediation Finance',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 821: Finance Seminar', onPressed: () {}),
                PaperTile(
                    paperTile: 'BSU 805: Research Methods', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 822: Entrepreneurial Finance',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 824: Corporate Finance', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 826: International Moneyand Banking',
                    onPressed: () {}),
              ],
            ),
          ),
        ));
  }
}
