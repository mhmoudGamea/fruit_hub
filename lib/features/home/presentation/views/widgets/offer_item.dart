import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utilies/app_images.dart';
import '../../../../../core/utilies/constants.dart';
import 'offer_item_details.dart';

class OfferItem extends StatelessWidget {
  final int index;
  const OfferItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - (2 * kAuthViewPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SvgPicture.asset(
                    AppImages.vectorOffer0,
                    fit: BoxFit.fill,
                  ),
                ),
                const Positioned(
                  top: 20,
                  right: 20,
                  child: OfferItemDetails(
                    title: 'عروض العيد',
                    subTitle: 'خصم 25%',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/fruit_offer$index.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
