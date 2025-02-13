import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';
import 'package:food_order/core/utils/custom_app_button.dart';
import 'package:food_order/core/utils/custom_appbar.dart';
import 'package:food_order/features/create_order/create_order_food_item_card.dart';
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
      backgroundColor: AppColor.softBackground,
      appBar: customAppBar(
          'Order Summery ${widget.item.item.keys.toList()[0].foodName}'),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.item.item.length,
              itemBuilder: (context, index) {
                return OrderSummeryItemCard(
                  item: widget.item.item.keys.toList()[index],
                  onadd: (value) => setState(() {
                    widget.item.item[widget.item.item.keys.toList()[index]] =
                        value;
                    widget.item.totalPrice += value;
                  }),
                  onremove: (value) => setState(() {
                    widget.item.item[widget.item.item.keys.toList()[index]] =
                        value;
                    widget.item.totalPrice -= value;

                    if (widget.item.totalPrice < 0) {
                      widget.item.totalPrice = 0;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Text('Cal'),
                    const Spacer(),
                    Text('${widget.item.totalcalories}')
                  ],
                ),
                Row(
                  children: [
                    const Text('Price'),
                    const Spacer(),
                    Text((widget.item.totalPrice).toString())
                  ],
                ),
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
      ]),
    );
  }
}
