import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';

class CustomTextField extends StatefulWidget {
  final String suffixText;
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.suffixText,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hasError = false;
  String? _errorText;

  void _validateField(String? value) {
    if (widget.validator != null) {
      final error = widget.validator!(value);
      setState(() {
        _hasError = error != null;
        _errorText = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppStyle.style16w400PrimaryText,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: widget.controller,
          onChanged: _validateField,
          validator: widget.validator,
          decoration: InputDecoration(
            filled: true,
            suffix: Text(
              widget.suffixText,
              style: AppStyle.style14w500neutralGray2,
            ),
            fillColor: AppColor.neutralWhite,
            hintText: widget.hintText,
            hintStyle: AppStyle.style16w400NeutralGray1,
            errorText: _hasError ? _errorText : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              borderSide: BorderSide(
                color: _hasError ? Colors.red : AppColor.softBackground,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              borderSide: BorderSide(
                color: _hasError ? Colors.red : AppColor.vibrantOrange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
