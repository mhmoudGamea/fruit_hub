import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/utilies/app_images.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view_model/page_controller/controller_cubit.dart';

import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ControllerCubit>(context);
    return PageView(
      controller: controller.getPageController,
      children: [
        PageViewItem(
          bgImage: AppImages.fruitBasketVector,
          image: AppImages.fruitBasket,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('مرحبًا بك في', style: AppStyle.fontbold23),
              const SizedBox(width: 10),
              Text(
                'HUB',
                style: AppStyle.fontbold23.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                'Fruit',
                style: AppStyle.fontbold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        const PageViewItem(
            bgImage: AppImages.pineapleVector,
            image: AppImages.pineaple,
            title: Text('ابحث وتسوق', style: AppStyle.fontbold23),
            subtitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية'),
      ],
    );
  }
}
