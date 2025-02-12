import 'package:flutter/material.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';

PreferredSizeWidget customAppBar(String title) => AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: AppStyle.style20w500primaryText,
      ),
      backgroundColor: AppColor.neutralWhite,
      leading: Image.asset('assets/images/arrowIcon.png'),
    );
