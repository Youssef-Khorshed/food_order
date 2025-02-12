// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';
import 'package:food_order/core/utils/custom_app_button.dart';
import 'package:food_order/features/create_order/food_item_model.dart';

class CreateOrderFoodItemCard extends StatefulWidget {
  final FoodItem item;
  final void Function(int value)? onadd;
  final void Function(int value)? onremove;
  const CreateOrderFoodItemCard({
    super.key,
    required this.item,
    this.onadd,
    this.onremove,
  });

  @override
  State<CreateOrderFoodItemCard> createState() =>
      _CreateOrderFoodItemCardState();
}

class _CreateOrderFoodItemCardState extends State<CreateOrderFoodItemCard> {
  bool chage = false;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: AppColor.primaryText,
      color: AppColor.neutralWhite,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        width: 183.w,
        child: Column(
          children: [
            Image.network(
              widget.item.imageUrl,
              width: 163.w,
              height: 108.h,
              fit: BoxFit.contain,
            ),
            Row(
              children: [
                Text(widget.item.foodName,
                    style: AppStyle.style16w400PrimaryText),
                const Spacer(),
                Text(
                  widget.item.calories.toString(),
                  style: AppStyle.style14w500neutralGray2,
                )
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Row(
              children: [
                Text(
                  "\$ 12",
                  style: AppStyle.style16w500PrimaryText,
                ),
                const Spacer(),
                chage
                    ? Row(
                        children: [
                          CustomAppBottom(
                            onTap: () {
                              setState(() {
                                if (count > 1) {
                                  count--;
                                  widget.onremove!(count);
                                }
                              });
                            },
                            btnWidth: 30.w,
                            btnheight: 30.h,
                            title: "-",
                            txtstyle: AppStyle.style16w400NeutralWhite,
                            withIcon: false,
                            btnColor: count > 1
                                ? AppColor.vibrantOrange
                                : AppColor.neutralGray2,
                          ),
                          SizedBox(width: 7.w),
                          Text(
                            count.toString(),
                            style: AppStyle.style16w400PrimaryText,
                          ),
                          SizedBox(width: 7.w),
                          CustomAppBottom(
                            onTap: () {
                              if (count < 50) {
                                count++;
                                widget.onadd!(count);
                              }
                            },
                            btnWidth: 30.w,
                            btnheight: 30.h,
                            title: "+",
                            txtstyle: AppStyle.style16w400NeutralWhite,
                            withIcon: false,
                            btnColor: AppColor.vibrantOrange,
                          ),
                        ],
                      )
                    : CustomAppBottom(
                        onTap: () => setState(() {
                          chage = !chage;
                        }),
                        btnWidth: 65.w,
                        btnheight: 32.h,
                        title: "Add",
                        txtstyle: AppStyle.style16w400NeutralWhite,
                        withIcon: false,
                        btnColor: AppColor.vibrantOrange,
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
