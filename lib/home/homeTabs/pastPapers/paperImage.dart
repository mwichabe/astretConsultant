import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: PhotoView(
            imageProvider: CachedNetworkImageProvider(paperImageUrl),
            loadingBuilder: (context, event) {
              if (event == null) {
                return Center(child: ColorLoader5());
              }
              // Display a placeholder while loading
              return Center(
                child: PlaceholderWidget(),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              // Display an error message
              return Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '$title \n is not yet uploaded. Please be patient...'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Placeholder Widget to display while loading or in case of error
class PlaceholderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300], // Placeholder color
      width: 200, // Adjust width as needed
      height: 200, // Adjust height as needed
      child: Center(
        child:
            CircularProgressIndicator(), // Placeholder content (e.g., loading indicator)
      ),
    );
  }
}
