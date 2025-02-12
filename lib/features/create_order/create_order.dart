import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/utils/custom_app_button.dart';
import 'package:food_order/core/utils/custom_appbar.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';
import 'package:food_order/features/create_order/create_order_food_item_card.dart';
import 'package:food_order/features/create_order/food_item_model.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({super.key});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  bool isAddItemsValid = false;
  List<FoodItem> vegetavleFoodItems = [];
  List<FoodItem> carbFoodItems = [];
  List<FoodItem> meatFoodItems = [];
  List<Map<FoodItem, int>> items = [];

  @override
  void initState() {
    fetch();
    super.initState();
  }

  fetch() async {
    List<dynamic> vegetablesjson =
        jsonDecode(await FoodItem.readJsonfromFile(name: 'vegetables'));
    List<dynamic> carbjson =
        jsonDecode(await FoodItem.readJsonfromFile(name: 'carb'));
    List<dynamic> meatjson =
        jsonDecode(await FoodItem.readJsonfromFile(name: 'meat'));
    vegetavleFoodItems = vegetablesjson
        .map((toElement) => FoodItem.fromJson(toElement))
        .toList();
    carbFoodItems =
        carbjson.map((toElement) => FoodItem.fromJson(toElement)).toList();
    meatFoodItems =
        meatjson.map((toElement) => FoodItem.fromJson(toElement)).toList();
    setState(() {});
  }

  void _handleSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBackground,
      appBar: customAppBar("Create your order"),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              'Vegetables',
              style: AppStyle.style20w500primaryText,
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 196.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vegetavleFoodItems.length,
                itemBuilder: (context, index) {
                  return CreateOrderFoodItemCard(
                    item: vegetavleFoodItems[index],
                  );
                }),
          )),
          SliverToBoxAdapter(
            child: Text(
              'Meats',
              style: AppStyle.style20w500primaryText,
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 196.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: meatFoodItems.length,
                itemBuilder: (context, index) {
                  return CreateOrderFoodItemCard(
                    item: meatFoodItems[index],
                  );
                }),
          )),
          SliverToBoxAdapter(
            child: Text(
              'Carbs',
              style: AppStyle.style20w500primaryText,
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 196.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carbFoodItems.length,
                itemBuilder: (context, index) {
                  return CreateOrderFoodItemCard(
                    item: carbFoodItems[index],
                  );
                }),
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Card(
              color: AppColor.lightBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Row(
                    children: [Text('Cal'), Spacer(), Text('data')],
                  ),
                  const Row(
                    children: [Text('Price'), Spacer(), Text('data')],
                  ),
                  CustomAppBottom(
                    title: "Next",
                    btnWidth: 327.w,
                    btnheight: 60.h,
                    txtstyle: isAddItemsValid
                        ? AppStyle.style16w400NeutralWhite
                        : AppStyle.style16w500NeutralGray2,
                    btnColor: isAddItemsValid
                        ? AppColor.vibrantOrange
                        : AppColor.softBackground,
                    withIcon: false,
                    onTap: isAddItemsValid ? _handleSubmit : null,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
