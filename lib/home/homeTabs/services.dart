import 'package:astret/home/homeTabs/serviceWidgets/bulletPoint.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AlertDialog(
                      title: const Text(
                        'Info',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text(
                        'Long press on an item to make a call',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.info,
                color: Colors.green,
                size: 30.0,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'At an affordable fee, you can get:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BulletPoint(text: 'Business proposals'),
                  BulletPoint(text: 'Diploma proposals'),
                  BulletPoint(text: 'Bachelors proposals'),
                  BulletPoint(text: 'Masters proposals'),
                  BulletPoint(text: 'PhD proposals'),
                  BulletPoint(text: 'Analysis using SPSS/STATA'),
                  BulletPoint(text: 'Power point presentations'),
                  BulletPoint(text: 'Plagiarism edits'),
                  BulletPoint(
                      text:
                          'Concept papers, journal development, and assignments'),
                  BulletPoint(text: 'Thesis'),
                  BulletPoint(text: 'Dissertations'),
                  BulletPoint(text: 'Defence preparations'),
                  BulletPoint(
                      text: 'Company profiles and any other research needs'),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Email us or WhatsApp or call the number attached to get professional assistance.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      whatsApp();
                    },
                    child: Image.asset(
                      'assets/whatsApp.jpg',
                      height: 60,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      openMail();
                    },
                    child: Image.asset(
                      'assets/gmail.jpg',
                      height: 60,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('tel:+254704858069'));
                    },
                    child: Image.asset(
                      'assets/phone.jpg',
                      height: 60,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

openMail() {
  return launchUrl(Uri.parse(
      'mailto:mwichabecollins@gmail.com?subject=Hello&body=Iam using Astret App and I would like to enquire about...)'));
}

whatsApp() {
  return launchUrl(
    Uri.parse(
      'whatsapp://send?phone=+254704858069+&text=Hello, Iam using Astret App'
      ', I would like to enquire about...',
    ),
  );
}
