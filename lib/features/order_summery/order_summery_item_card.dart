// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';
import 'package:food_order/features/create_order/food_item_model.dart';

// ignore: must_be_immutable
class OrderSummeryItemCard extends StatefulWidget {
  final FoodItem item;
  final void Function(int value) onadd;
  final void Function(int value) onremove;
  int count;
  OrderSummeryItemCard({
    super.key,
    required this.item,
    required this.onadd,
    required this.onremove,
    required this.count,
  });

  @override
  State<OrderSummeryItemCard> createState() => _OrderSummeryItemCardState();
}

class _OrderSummeryItemCardState extends State<OrderSummeryItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.w),
      child: Card(
        elevation: 1,
        shadowColor: AppColor.primaryText,
        color: AppColor.neutralWhite,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.network(
                widget.item.imageUrl,
                width: 76.w,
                height: 62.h,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item.foodName,
                      style: AppStyle.style16w400PrimaryText),
                  Text(
                    "${widget.item.calories} Cal",
                    style: AppStyle.style14w400NeutralGray1,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$ 12",
                    style: AppStyle.style16w500PrimaryText,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.vibrantOrange,
                        radius: 18.r,
                        child: GestureDetector(
                          onTap: () => setState(() {
                            if (widget.count > 0) {
                              widget.count--;
                              widget.onremove(widget.count);
                              debugPrint(widget.count.toString());
                            }
                          }),
                          child: const Icon(
                            color: AppColor.neutralWhite,
                            Icons.remove,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        widget.count.toString(),
                        style: AppStyle.style16w400PrimaryText,
                      ),
                      SizedBox(width: 10.w),
                      CircleAvatar(
                        backgroundColor: AppColor.vibrantOrange,
                        radius: 18.r,
                        child: GestureDetector(
                          onTap: () => setState(() {
                            if (widget.count < 50) {
                              widget.count++;
                              widget.onadd(widget.count);
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
