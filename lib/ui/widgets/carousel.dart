import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:tech_ecommerce/ui/widgets/imageCarroussel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.8,
              ),
              items: const [
                ImageCarroussel(imageURL: "lib/images/banner1.jpg", isNetworkImage: false, width: 320, height: 100),
                ImageCarroussel(imageURL: "lib/images/banner2.jpg", isNetworkImage: false, width: 320, height: 100),
                ImageCarroussel(imageURL: "lib/images/banner3.jpg", isNetworkImage: false, width: 320, height: 100),
                ImageCarroussel(imageURL: "lib/images/banner4.png", isNetworkImage: false, width: 320, height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }
}