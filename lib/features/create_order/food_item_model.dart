import 'dart:io';

class FoodItem {
  final String foodName;
  final int calories;
  final String imageUrl;

  FoodItem({
    required this.foodName,
    required this.calories,
    required this.imageUrl,
  });

  // Factory constructor to create a FoodItem from JSON
  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      foodName: json['food_name'] ?? '',
      calories: json['calories'] ?? 0,
      imageUrl: json['image_url'] ?? '',
    );
  }

  ///Users/youssef/Development/Flutter projects/Test Projects/foodOrderAssignment/food_order/lib/core/utils/vegetables.json

  static Future<String> readJsonfromFile({required String name}) async {
    try {
      var filePath =
          'Users/youssef/Development/Flutter projects/Test Projects/foodOrderAssignment/food_order/lib/core/utils/$name.json';

      var file = File(filePath);
      if (!await file.exists()) {
        throw Exception('File not found: $filePath');
      }
      return await file.readAsString();
    } catch (e) {
      rethrow;
    }
  }
}
