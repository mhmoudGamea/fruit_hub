abstract class CartService {
  // method to check if specific item is exist ?
  // Future<bool> isCartItemExist(String documentId);

  // method to add to cart
  Future<void> addToCart({
    required Map<String, dynamic> data,
    required String documentId,
  });

  // method to remove from cart

  // method to update data in cart item
  Future<void> updateItemInCart(String documentId, Map<String, dynamic> map);

  // method to get all items in user cart
  Future<List<Map<String, dynamic>>> getAllItemsInCart();
}
