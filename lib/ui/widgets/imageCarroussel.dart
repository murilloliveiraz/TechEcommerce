import 'package:flutter/material.dart';

class ImageCarroussel extends StatelessWidget {
  const ImageCarroussel({
    super.key,
    required this.width,
    required this.height, 
    required this.imageURL, 
    required this.isNetworkImage,
    });

  final double width, height;
  final String imageURL;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey[200]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image(image: isNetworkImage ? NetworkImage(imageURL) : AssetImage(imageURL) as ImageProvider, fit: BoxFit.cover),
      ),
    );
  }
}