import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/Extension/navigation.dart';
import 'package:food_order/core/Routes/routes.dart';
import 'package:food_order/core/utils/custom_app_button.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';

class Welcomscreen extends StatelessWidget {
  const Welcomscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          child: Image.asset(
            'assets/images/welcomscreen.jpeg',
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 80.h,
          left: 0,
          right: 0,
          child: Text(
            textAlign: TextAlign.center,
            'Balanced Meal',
            style: AppStyle.style48w800WhiteNeutralWhite,
          ),
        ),
        Positioned(
            top: height / 1.65,
            left: 24,
            right: 24,
            child: Text(
              textAlign: TextAlign.center,
              'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.',
              style: AppStyle.style20w300subtleGray,
            )),
        Positioned(
            top: height / 1.25,
            left: 24,
            right: 24,
            child: CustomAppBottom(
                onTap: () => context.pushNamed(Routes.userDetails),
                title: 'Order Food',
                btnWidth: 327.w,
                btnheight: 69.h,
                txtstyle: AppStyle.style16w500NeutralWhite,
                btnColor: AppColor.vibrantOrange,
                withIcon: false))
      ],
    ));
  }
}
