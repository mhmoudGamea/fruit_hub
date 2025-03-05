import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'offer_item.dart';

class OfferList extends StatelessWidget {
  const OfferList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        // aspectRatio: 330 / 160,
        height: 158,
        autoPlayCurve: Curves.linear,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        viewportFraction: 100,
        // autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
      ),
      items: List.generate(
        3,
        (index) => OfferItem(index: index),
      ),
    );
  }
}
