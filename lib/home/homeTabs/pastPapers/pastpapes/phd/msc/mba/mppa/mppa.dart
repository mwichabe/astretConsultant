import 'package:astret/colors/loaders.dart';
import 'package:astret/home/homeTabs/pastPapers/pastPaperWidgets/paperTile.dart';
import 'package:flutter/material.dart';

class MPPA extends StatelessWidget {
  const MPPA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MPPA'),
          centerTitle: true,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                PaperTile(
                    paperTile: 'AMC 800: Research Methods in Social Science ',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 800: Microeconomics for Public Policy',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        ' APP 801: Quantitative Techniques for Public Policy ',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 802: Public Administration',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 803: Devolved Government',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 804: Law and Governance', onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 805: Macroeconomics for Public Policy',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 806: Public Finance and Accounting',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 807: Public Information Systems',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 808: Corporate Governance',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 809: Project Management in Public Sector',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'APP 816: Strategic Management in the Public Sector',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 817: Public Policy Analysis',
                    onPressed: () {}),
                PaperTile(paperTile: 'APP 810: Project', onPressed: () {}),
                PaperTile(
                    paperTile:
                        'APP 811: Public Procurement and Supply Chain Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 813: Conflict and Disaster Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 929: Marketing Seminar', onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 930: Independent Study in Marketing',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'APP 814: Human Resource Management in Public Sector',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'APP 814: Sustainable Development',
                    onPressed: () {}),
              ],
            ),
          ),
        ));
  }
}
