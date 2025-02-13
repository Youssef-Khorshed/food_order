import 'package:food_order/features/create_order/food_item_model.dart';

class OrderSummeryModel {
  Map<FoodItem, int> item;
  int totalPrice;
  int totalcalories;

  OrderSummeryModel(
      {required this.item,
      required this.totalPrice,
      required this.totalcalories});
}
