import 'package:fruit_hub/core/utilies/app_images.dart';

class BottomNavigationBarModel {
  final String inActiveSvg, activeSvg;
  final String name;

  BottomNavigationBarModel(
      {required this.inActiveSvg, required this.activeSvg, required this.name});

  static List<BottomNavigationBarModel> get bottomNavigationBarModel {
    return [
      BottomNavigationBarModel(
          inActiveSvg: AppImages.home,
          activeSvg: AppImages.homeB,
          name: 'الرئيسيه'),
      BottomNavigationBarModel(
          inActiveSvg: AppImages.category,
          activeSvg: AppImages.categoryB,
          name: 'المنتجات'),
      BottomNavigationBarModel(
          inActiveSvg: AppImages.cart,
          activeSvg: AppImages.cartB,
          name: 'سله التسوق'),
      BottomNavigationBarModel(
          inActiveSvg: AppImages.user,
          activeSvg: AppImages.userB,
          name: 'حسابي'),
    ];
  }
}
