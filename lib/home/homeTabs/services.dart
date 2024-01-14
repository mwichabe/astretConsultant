import 'package:astret/home/homeTabs/serviceWidgets/bulletPoint.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: AlertDialog(
                            title: Text('Info'),
                            content:
                                Text('Long press on an item to make a call'),
                          ),
                        ));
              },
              icon: const Icon(Icons.info))
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
                      'images/appLogos/whatsApp.png',
                      height: 60,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      openMail();
                    },
                    child: Image.asset(
                      'images/appLogos/gmail.jpg',
                      height: 60,
                    ),
                  ),
                  IconButton(
                    onPressed: () => launchUrl(Uri.parse('tel:+254704858069')),
                    icon: const Icon(
                      Icons.phone,
                      size: 60,
                      color: Colors.green,
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
      'mailto:mwichabecollins@gmail.com?subject=Hello&body=Iam using Kibabii Library App and I would like to enquire about...)'));
}

whatsApp() {
  return launchUrl(
    Uri.parse(
      'whatsapp://send?phone=+254704858069+&text=Hello, Iam using the Kibabbii Library App'
      'application and I would like to enquire about...',
    ),
  );
}
