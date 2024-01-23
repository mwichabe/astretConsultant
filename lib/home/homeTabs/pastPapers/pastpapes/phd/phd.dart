import 'package:astret/home/homeTabs/pastPapers/pastPaperWidgets/paperTile.dart';
import 'package:flutter/material.dart';

class PhD extends StatelessWidget {
  const PhD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PhD business Units'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                PaperTile(
                    paperTile: 'BMS 900: Statistics for Business I ',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 901: Business Research Methods',
                    onPressed: () {}),
                PaperTile(
                    paperTile: ' BMS 902: Statistics for Business II ',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 919: Data Analysis and Measurement',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BBA 920: Economic Analysis for Business Decisions',
                    onPressed: () {}),
                PaperTile(paperTile: 'BSU900: Thesis', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 900: Accounting theory', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 902: Theory of taxation', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 903: Accounting Seminar', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 904: Independent Study in Accounting',
                    onPressed: () {}),
                PaperTile(
                    paperTile: ' BAC 901: Empirical Finance', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 905: Theory of Finance', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 906: Finance Seminar', onPressed: () {}),
                PaperTile(
                    paperTile: 'BAC 907: Independent Study in Finance',
                    onPressed: () {}),
                PaperTile(
                    paperTile: ' BBA 921: Consumer Behaviour',
                    onPressed: () {}),
                PaperTile(
                    paperTile: ' BBA 922: Marketing Theory', onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 929: Marketing Seminar', onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 930: Independent Study in Marketing',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 923: Human Resource Development',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 924: Organizational Theory and Behaviour',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 931: Human Resource Manager Seminar',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BBA 932: Independent Study in Human Resource Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 925: Global Business Strategies',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BBA 926: Theoretical Foundations of Strategic Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 933: Strategic Management Seminar',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BBA 934: Independent Study in Strategic Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        ' BBA 927: Entrepreneurship and Business Development',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BBA 928: Planning for Growth in Entrepreneurship',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BBA 934: Independent Study in Strategic Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 935: Entrepreneurship Seminar',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BBA 936: Independent Study in Entrepreneurship',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 907: Advanced Operations Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: ' BMS 903: Decision Models & Analysis',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 908: Seminar in Management Science',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        ' BMS 909: Independent Study in Management Science',
                    onPressed: () {}),
                PaperTile(
                    paperTile: 'BMS 905: Strategic Information Systems',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        ' BMS 913: Advanced Topics in Information Systems',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        ' BMS 914: Seminar in Management Information Systems',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        ' BMS 915: Independent Study in Information Systems',
                    onPressed: () {}),
                PaperTile(
                    paperTile: ' BMS 906: Project Economic Analysis',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        ' BMS 916: Theoretical Foundations of Project Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile: ' BMS 917: Seminar in Project Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        ' BMS 918: Independent Study in Project Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        ' BMS 916: Theoretical Foundations of Project Management',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        '  BMS 904: Stochastic Analysis of Insurance Portfolios',
                    onPressed: () {}),
                PaperTile(
                    paperTile: ' BMS 810: Advanced Actuarial Science Models',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        'BMS 911: Seminar in Actuarial Science & Insurance',
                    onPressed: () {}),
                PaperTile(
                    paperTile:
                        ' BMS 912: Independent Study in Actuarial Science & Insurance',
                    onPressed: () {}),
              ],
            ),
          ),
        ));
  }
}
