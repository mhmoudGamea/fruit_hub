import 'package:fruit_hub/features/cart/data/cart_model.dart';

class ProductModelDetails {
  final String productName;
  final String productPrice;
  final String productCode;
  final String productDescription;
  final String productImage;
  final String productCount;

  ProductModelDetails({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.productImage,
    required this.productCount,
  });

  static toJson(CartModel cartModel) {
    return {
      'productName': cartModel.product.productName,
      'productPrice': cartModel.product.productPrice,
      'productCode': cartModel.product.productCode,
      'productDescription': cartModel.product.productDescription,
      'productImage': cartModel.product.imageUrl,
      'productCount': cartModel.count,
    };
  }
}
