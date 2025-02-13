import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/Extension/navigation.dart';
import 'package:food_order/core/Routes/routes.dart';
import 'package:food_order/core/utils/custom_app_button.dart';
import 'package:food_order/core/utils/custom_appbar.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';
import 'package:food_order/features/create_order/create_order_food_item_card.dart';
import 'package:food_order/features/create_order/food_item_model.dart';
import 'package:food_order/features/order_summery/order_summery_model.dart';

class CreateOrder extends StatefulWidget {
  final int totalCalories;
  const CreateOrder({super.key, required this.totalCalories});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  bool isAddItemsValid = false;
  List<FoodItem> vegetavleFoodItems = [];
  List<FoodItem> carbFoodItems = [];
  List<FoodItem> meatFoodItems = [];
  Map<FoodItem, int> items = {};
  int totalVegetables = 0, totalMeat = 0, totalCarb = 0;

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

  void _handleSubmit() {
    context.pushNamed(Routes.orderSummery,
        arguments: OrderSummeryModel(
            item: items,
            totalPrice: (totalVegetables + totalMeat + totalCarb),
            totalcalories: widget.totalCalories));
  }

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
                    onadd: (value) => setState(() {
                      items[vegetavleFoodItems[index]] = value;
                      totalVegetables += value;
                    }),
                    onremove: (value) => setState(() {
                      items[vegetavleFoodItems[index]] = value;
                      totalVegetables -= value;

                      if (totalVegetables < 0) {
                        totalVegetables = 0;
                      }
                    }),
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
                    onadd: (value) => setState(() {
                      items[meatFoodItems[index]] = value;
                      totalMeat += value;
                    }),
                    onremove: (value) => setState(() {
                      items[meatFoodItems[index]] = value;
                      totalMeat -= value;

                      if (totalMeat < 0) {
                        totalMeat = 0;
                      }
                    }),
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
                    onadd: (value) => setState(() {
                      items[carbFoodItems[index]] = value;
                      totalCarb += value;
                    }),
                    onremove: (value) => setState(() {
                      items[carbFoodItems[index]] = value;
                      totalCarb -= value;

                      if (totalCarb < 0) {
                        totalCarb = 0;
                      }
                    }),
                  );
                }),
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Card(
              color: AppColor.lightBackground,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Cal',
                          style: AppStyle.style16w400PrimaryText,
                        ),
                        const Spacer(),
                        Text(
                          "${widget.totalCalories} Cal out of 1200 Cal",
                          style: AppStyle.style14w400NeutralGray2,
                        ) //
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          'Price',
                          style: AppStyle.style16w400PrimaryText,
                        ),
                        const Spacer(),
                        Text(
                          "\$ ${(totalVegetables + totalMeat + totalCarb)}",
                          style: AppStyle.style16w500VibrantOrange,
                        )
                      ],
                    ),
                    SizedBox(height: 14.h),
                    CustomAppBottom(
                      title: "Next",
                      btnWidth: 327.w,
                      btnheight: 60.h,
                      txtstyle: AppStyle.style16w400NeutralWhite,
                      btnColor: totalVegetables + totalMeat + totalCarb > 0
                          ? AppColor.vibrantOrange
                          : AppColor.softBackground,
                      withIcon: false,
                      onTap: totalVegetables + totalMeat + totalCarb > 0
                          ? _handleSubmit
                          : null,
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
