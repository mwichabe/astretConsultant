import 'package:astret/colors/loaders.dart';
import 'package:astret/home/homeTabs/pastPapers/paperImage.dart';
import 'package:astret/home/homeTabs/pastPapers/pastPaperWidgets/paperTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('mppa').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: ColorLoader5());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Text(
                    'Past Paper is yet to be uploaded be patient');
              } else {
                final eventDoc = snapshot.data!.docs;
                return Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ListView.builder(
                      itemCount: eventDoc.length,
                      itemBuilder: (context, index) {
                        final pastPaper = eventDoc[index];
                        final paperImageUrl = pastPaper['paperImageUrl'];
                        final title = pastPaper['title'];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              PaperTile(
                                  paperTile: title,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PaperImage(
                                                title: title,
                                                paperImageUrl: paperImageUrl)));
                                  }),
                            ],
                          ),
                        );
                      }),
                );
              }
            }));
  }
}
