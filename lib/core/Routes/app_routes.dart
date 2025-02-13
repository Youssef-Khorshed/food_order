import 'package:flutter/cupertino.dart';
import 'package:food_order/core/Routes/routes.dart';
import 'package:food_order/features/create_order/create_order.dart';
import 'package:food_order/features/order_summery/order_summery.dart';
import 'package:food_order/features/order_summery/order_summery_model.dart';
import 'package:food_order/features/user_details/user_details.dart';
import 'package:food_order/features/welcom_screen/splash_screen.dart';
import 'package:food_order/features/welcom_screen/welcom_screen.dart';

class AppRoutes {
  static Route generateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      case Routes.welcom:
        return CupertinoPageRoute(builder: (context) => const Welcomscreen());

      case Routes.userDetails:
        return CupertinoPageRoute(builder: (context) => const UserDetails());

      case Routes.orderSummery:
        return CupertinoPageRoute(
            builder: (context) =>
                OrderSummery(item: settings.arguments as OrderSummeryModel));

      case Routes.createOrder:
        return CupertinoPageRoute(
            builder: (context) =>
                CreateOrder(totalCalories: settings.arguments as int));

      default:
        return CupertinoPageRoute(
            builder: (context) => const Text('data not found'));
    }
  }
}
