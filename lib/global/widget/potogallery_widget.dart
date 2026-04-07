import 'package:flutter/cupertino.dart';
import 'package:galleryimage/galleryimage.dart';

class PhotoGalleryWidget extends StatelessWidget {
   const PhotoGalleryWidget({super.key,required this.listOfUrls});
  final List<String> listOfUrls;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: GalleryImage(
        imageUrls: listOfUrls,
        numOfShowImages: listOfUrls.length>4?3:listOfUrls.length,
        childAspectRatio: 16/10,

        titleGallery: "Comment Image",
      ),
    );
  }
}
