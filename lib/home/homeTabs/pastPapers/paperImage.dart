import 'package:flutter/material.dart';
import 'package:astret/colors/colors.dart';
import 'package:astret/colors/loaders.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PaperImage extends StatelessWidget {
  final String title;
  final String paperImageUrl;

  const PaperImage({Key? key, required this.title, required this.paperImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(title),
        ),
        elevation: 2.0,
        backgroundColor: AppColor.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: CachedNetworkImage(
            imageUrl: paperImageUrl,
            placeholder: (context, url) => ColorLoader5(),
            errorWidget: (context, url, error) => Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '$title \n is not yet uploaded. Please be patient...'),
                ),
              ),
            ),
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
