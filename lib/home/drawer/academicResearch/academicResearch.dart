import 'package:astret/home/drawer/academicResearch/academicResearchWidgets/customAlertDialog.dart';
import 'package:astret/home/home.dart';
import 'package:astret/home/homeTabs/pastPapers/pastPaperWidgets/paperTile.dart';
import 'package:flutter/material.dart';

class AcademicResearch extends StatelessWidget {
  const AcademicResearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
          icon: const Icon(Icons.home),
        ),
        title: const Text(
          'SERVICES',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog());
              },
              icon: Icon(Icons.more_vert))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PaperTile(paperTile: 'i. Virtual Tutorials', onPressed: () {}),
            PaperTile(
              paperTile: 'ii. Physical Tutorials (Around Nairobi)',
              onPressed: () {},
            ),
            const SizedBox(height: 16.0),
            const Text(
              'These are the units/subjects scheduled for tutorials:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Card(
              elevation: 4,
              // ignore: unnecessary_const
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(title: Text('1. Managerial economics')),
                  ListTile(title: Text('2. Micro - economics')),
                  ListTile(title: Text('3. Macro - economics')),
                  ListTile(title: Text('4. Quantitative Analysis')),
                  ListTile(title: Text('5. Applied Statistics')),
                  ListTile(title: Text('6. Theory of Finance')),
                  ListTile(title: Text('7. Taxation')),
                  ListTile(title: Text('8. Financial Accounting')),
                  ListTile(title: Text('9. Cost Accounting')),
                  ListTile(title: Text('10. Management Accounting')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
