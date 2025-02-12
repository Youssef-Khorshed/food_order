import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';

class CustomAppBottom extends StatelessWidget {
  final String title;
  final String? icon;
  final Color? txtColor, btnColor;
  final Color? iconColor, borderColor;
  final Function()? onTap;
  final double? btnWidth;
  final TextStyle? txtstyle;
  final bool withIcon;
  final double? btnradius;
  final double? btnheight;
  const CustomAppBottom(
      {super.key,
      required this.title,
      this.txtColor,
      this.btnColor,
      this.icon,
      this.btnheight,
      this.txtstyle,
      this.iconColor,
      this.onTap,
      this.btnWidth,
      this.btnradius,
      required this.withIcon,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: btnWidth,
            height: btnheight ?? 50.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
            decoration: BoxDecoration(
              color: btnColor,
              border: Border.all(
                  color: borderColor ?? AppColor.transparent, width: 1.5.w),
              borderRadius:
                  BorderRadius.all(Radius.circular(btnradius ?? 12.r)),
            ),
            child: withIcon
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          icon ?? "",
                          height: 20.h,
                          width: 20.w,
                          color: iconColor ?? AppColor.vibrantOrange,
                        ),
                        SizedBox(width: 5.w),
                        SizedBox(
                          width: 109.w,
                          child: FittedBox(
                            child: Text(
                              title,
                              style:
                                  txtstyle ?? AppStyle.style14w500neutralGray2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
                    child: Center(
                      child: Text(
                        title,
                        style: txtstyle ?? AppStyle.style14w500neutralGray2,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
