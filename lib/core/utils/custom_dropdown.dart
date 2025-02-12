// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';

class CustomDetailsfilterdropdown extends StatefulWidget {
  final void Function(String?)? onChanged;
  final String? initialValue;
  final String? selectedValue;

  const CustomDetailsfilterdropdown({
    super.key,
    this.onChanged,
    this.initialValue,
    this.selectedValue,
  });

  @override
  State<CustomDetailsfilterdropdown> createState() =>
      _CustomDetailsfilterdropdownState();
}

class _CustomDetailsfilterdropdownState
    extends State<CustomDetailsfilterdropdown> {
  String? selectedItem;
  final items = ["Male", "Female"];

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialValue;
  }

  @override
  void didUpdateWidget(CustomDetailsfilterdropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedValue != oldWidget.selectedValue) {
      setState(() {
        selectedItem = widget.selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      value: selectedItem,
      underline: const SizedBox(),
      isExpanded: true,
      iconStyleData: const IconStyleData(
        iconEnabledColor: AppColor.neutralGray1,
        icon: Icon(Icons.keyboard_arrow_down),
      ),
      buttonStyleData: ButtonStyleData(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColor.neutralWhite, AppColor.neutralWhite],
          ),
          color: AppColor.neutralWhite,
          border: Border.all(color: AppColor.softBackground, width: 1),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColor.neutralWhite,
        ),
        useSafeArea: true,
      ),
      hint: Text(
        "Choose Your Gender",
        style: AppStyle.style14w500PrimaryText,
        textAlign: TextAlign.center,
      ),
      items: items
          .map((gender) => DropdownMenuItem(
                value: gender,
                child: Text(
                  gender,
                  style: AppStyle.style14w500PrimaryText,
                ),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedItem = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}
