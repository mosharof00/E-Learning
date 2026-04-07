import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class MyPhotoGallery extends StatefulWidget {
  MyPhotoGallery(this.imageUrls, {super.key, this.downloadAvailable = true});
  List<String> imageUrls = [];
  bool downloadAvailable;

  @override
  _MyPhotoGalleryState createState() => _MyPhotoGalleryState();
}

class _MyPhotoGalleryState extends State<MyPhotoGallery> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: ColorName.primary,
        title: AppTextStyle(
          text: 'Image Gallery',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: widget.imageUrls.length,
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: CachedNetworkImageProvider(widget.imageUrls[index]),
                initialScale: PhotoViewComputedScale.contained * 1.0,
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2.0,
                heroAttributes: PhotoViewHeroAttributes(tag: widget.imageUrls[index]),
              );
            },
            scrollDirection: Axis.horizontal,
            enableRotation: true,
            pageController: PageController(initialPage: 0),
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Text(
                '${currentIndex + 1}/${widget.imageUrls.length}',
                style: const TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: widget.downloadAvailable
          ? FloatingActionButton(
              backgroundColor: Colors.grey,
              onPressed: () {
                _saveImage(widget.imageUrls[currentIndex]);
              },
              child: const Icon(Icons.download),
            )
          : Container(),
    );
  }

  Future<void> _saveImage(String url) async {
    // try {
    //   // Save the image to the device's gallery
    //   var response = await http.get(Uri.parse(url));
    //   var filePath = await ImageGallerySaver.saveImage(Uint8List.fromList(response.bodyBytes), quality: 60, name: 'image_${DateTime.now().millisecondsSinceEpoch}');
    //
    //   HelperUtils.showToast("File saved to gallery");
    //   print('File saved to gallery: $filePath');
    // } catch (e) {
    //   print('Error saving image: $e');
    // }
  }
}
