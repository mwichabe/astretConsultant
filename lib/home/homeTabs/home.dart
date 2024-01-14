import 'package:astret/colors/loaders.dart';
import 'package:astret/home/homeTabs/homeWidgets/homeCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainHome extends StatefulWidget {
  const MainHome({Key? key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  late String quoteText = '';
  late String author = '';
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final response =
          await http.get(Uri.parse('https://api.quotable.io/random'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        quoteText = data['content'];
        author = data['author'];
      } else {
        throw Exception('Failed to load data - ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
      errorMessage = 'Failed to fetch data. Please try again later.';
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Word from Astret App',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            if (isLoading)
              ColorLoader5()
            else if (errorMessage.isNotEmpty)
              Text(errorMessage)
            else
              HomeCard(
                text: quoteText,
                author: author,
              ),
          ],
        ),
      ),
    );
  }
}
