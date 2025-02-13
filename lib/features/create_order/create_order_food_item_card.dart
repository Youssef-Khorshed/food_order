// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';
import 'package:food_order/features/create_order/food_item_model.dart';

class CreateOrderFoodItemCard extends StatefulWidget {
  final FoodItem item;
  final void Function(int value) onadd;
  final void Function(int value) onremove;
  const CreateOrderFoodItemCard({
    super.key,
    required this.item,
    required this.onadd,
    required this.onremove,
  });

  @override
  State<CreateOrderFoodItemCard> createState() =>
      _CreateOrderFoodItemCardState();
}

class _CreateOrderFoodItemCardState extends State<CreateOrderFoodItemCard> {
  bool chage = false;
  int count = 0;
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
              fit: BoxFit.fill,
            ),
            Row(
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(widget.item.foodName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppStyle.style16w400PrimaryText),
                ),
                const Spacer(),
                Text(
                  "${widget.item.calories} Cal",
                  style: AppStyle.style14w400NeutralGray1,
                ),
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
                          CircleAvatar(
                            backgroundColor: AppColor.vibrantOrange,
                            radius: 18.r,
                            child: GestureDetector(
                              onTap: () => setState(() {
                                if (count > 0) {
                                  count--;
                                  widget.onremove(count);
                                }
                              }),
                              child: const Icon(
                                color: AppColor.neutralWhite,
                                Icons.remove,
                              ),
                            ),
                          ),
                          SizedBox(width: 7.w),
                          Text(
                            count.toString(),
                            style: AppStyle.style16w400PrimaryText,
                          ),
                          SizedBox(width: 7.w),
                          CircleAvatar(
                            backgroundColor: AppColor.vibrantOrange,
                            radius: 18.r,
                            child: GestureDetector(
                              onTap: () => setState(() {
                                if (count < 50) {
                                  count++;
                                  widget.onadd(count);
                                }
                              }),
                              child: const Icon(
                                color: AppColor.neutralWhite,
                                Icons.add,
                              ),
                            ),
                          ),
                        ],
                        //ll
                      )
                    : GestureDetector(
                        onTap: () => setState(() {
                          chage = !chage;
                        }),
                        child: Container(
                          height: 45.h,
                          width: 60.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: AppColor.vibrantOrange,
                          ),
                          child: Center(
                            child: Text(
                              "Add",
                              style: AppStyle.style16w400NeutralWhite,
                            ),
                          ),
                        ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
