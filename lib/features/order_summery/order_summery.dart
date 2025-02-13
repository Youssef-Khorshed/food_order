import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';
import 'package:food_order/core/utils/custom_app_button.dart';
import 'package:food_order/core/utils/custom_appbar.dart';
import 'package:food_order/features/order_summery/order_summery_item_card.dart';
import 'package:food_order/features/order_summery/order_summery_model.dart';

// ignore: must_be_immutable
class OrderSummery extends StatefulWidget {
  OrderSummeryModel item;

  OrderSummery({super.key, required this.item});

  @override
  State<OrderSummery> createState() => _OrderSummeryState();
}

class _OrderSummeryState extends State<OrderSummery> {
  void _handleSubmit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Order Placed Successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBackground,
      appBar: customAppBar('Order Summery'),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          height: MediaQuery.of(context).size.height / 1.57,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.item.item.length,
              itemBuilder: (context, index) {
                return OrderSummeryItemCard(
                  item: widget.item.item.keys.toList()[index],
                  count: widget.item.item.values.toList()[index],
                  onadd: (value) => setState(() {
                    widget.item.item[widget.item.item.keys.toList()[index]] =
                        value;
                    widget.item.totalPrice += (value * 12);
                  }),
                  onremove: (value) => setState(() {
                    widget.item.item[widget.item.item.keys.toList()[index]] =
                        value;

                    widget.item.totalPrice -= (value * 12);
                    if (value == 0) {
                      widget.item.totalPrice -= (1 * 12);

                      widget.item.item
                          .remove(widget.item.item.keys.toList()[index]);
                    }
                  }),
                );
              }),
        )),
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: Card(
            elevation: 5,
            shadowColor: AppColor.primaryText,
            color: AppColor.neutralWhite,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 5.h),
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
                        "${widget.item.totalcalories} Cal out of 1200 Cal",
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
                        "\$ ${(widget.item.totalPrice)}",
                        style: AppStyle.style16w500VibrantOrange,
                      )
                    ],
                  ),
                  SizedBox(height: 14.h),
                  CustomAppBottom(
                    title: "Confirm",
                    btnWidth: 327.w,
                    btnheight: 60.h,
                    txtstyle: AppStyle.style16w400NeutralWhite,
                    btnColor: widget.item.totalPrice > 0
                        ? AppColor.vibrantOrange
                        : AppColor.softBackground,
                    withIcon: false,
                    onTap: widget.item.totalPrice > 0 ? _handleSubmit : null,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
