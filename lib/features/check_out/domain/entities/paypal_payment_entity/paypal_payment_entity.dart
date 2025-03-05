import 'amount_entity.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  AmountEntity? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});
}
