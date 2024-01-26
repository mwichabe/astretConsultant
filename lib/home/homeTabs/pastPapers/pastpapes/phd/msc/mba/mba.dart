import 'package:astret/colors/loaders.dart';
import 'package:astret/home/homeTabs/pastPapers/pastPaperWidgets/paperTile.dart';
import 'package:flutter/material.dart';

class MBA extends StatelessWidget {
  const MBA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MBA'),
          centerTitle: true,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                PaperTile(
                    paperTile: 'BBA 820: Managerial Functions',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 822: Human Resource Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 840: Marketing Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 813: Financial Accounting',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 840: Quantitative Techniques',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 823: Strategic Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 821: Managerial Economics',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 841: Management Information',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 814: Management Accounting',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 815: Financial Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BSU 805: Research Methods', onPressed: () {}),
                PaperTile(
                    paperTile: 'BSU 806: Research Project', onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 843: Marketing Research', onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 845: Strategic Marketing Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 848: Marketing Management Seminar',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 844: Marketing Communication Strategies',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 846: Global Marketing', onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BBA 825: Human Resources Employment and Development',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BBA 860: Business Strategic Beehaviour and Leadership',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BBA 861: Global Strategic Behaviour and Leadership',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 862: Strategic Management Seminar',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 831: Total Quality Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 829: Management of Strategic Change',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 819: Financial Analysis', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 820: International FInance',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 821: Finance Seminar', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 822: Entrepreneurial Finance',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 823: Corporate Finance', onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 842: Project Planning & organisation',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BMS 843: Project Financing & Resource Scheduling',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 844: Project Monitoring & Evaluation',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 848: Operations Research I',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 849: Operations Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 845: Database Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 846: Database Communication & Networking',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 847: System Analysis & Design',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 850: E-Commerce Systems Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BMS 851: Advanced Management Information System',
                    onPressed: () {}),
              ],
            ),
          ),
        ));
  }
}
