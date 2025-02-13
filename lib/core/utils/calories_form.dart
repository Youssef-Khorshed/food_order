import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/utils/custom_dropdown.dart';
import 'package:food_order/core/utils/custom_textfield.dart';
import 'package:food_order/core/style/styles.dart';

class CalorieForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController ageController;
  final String? selectedGender;
  final Function(String?) onGenderChanged;
  final String? calorieResult;

  const CalorieForm({
    super.key,
    required this.formKey,
    required this.weightController,
    required this.heightController,
    required this.ageController,
    this.selectedGender,
    required this.onGenderChanged,
    this.calorieResult,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: AppStyle.style16w400PrimaryText,
          ),
          SizedBox(height: 10.h),
          CustomDetailsfilterdropdown(
            onChanged: onGenderChanged,
            initialValue: selectedGender,
          ),
          SizedBox(height: 24.h),
          CustomTextField(
            suffixText: 'KG',
            hintText: 'Enter your weight',
            labelText: 'Weight',
            controller: weightController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Weight is required';
              }
              final weightValue = double.tryParse(value);
              if (weightValue == null) {
                return 'Please enter a valid number';
              }
              if (weightValue <= 45 || weightValue > 300) {
                return 'Please enter a valid weight (45-300 kg)';
              }
              return null;
            },
          ),
          SizedBox(height: 24.h),
          CustomTextField(
            suffixText: 'Cm',
            hintText: 'Enter your height',
            labelText: 'Height',
            controller: heightController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Height is required';
              }
              final heightValue = double.tryParse(value);
              if (heightValue == null) {
                return 'Please enter a valid number';
              }
              if (heightValue <= 150 || heightValue > 300) {
                return 'Please enter a valid height (150-300 cm)';
              }
              return null;
            },
          ),
          SizedBox(height: 24.h),
          CustomTextField(
            suffixText: '',
            hintText: 'Enter your age',
            labelText: 'Age',
            controller: ageController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Age is required';
              }
              final ageValue = int.tryParse(value);
              if (ageValue == null) {
                return 'Please enter a valid number';
              }
              if (ageValue <= 1 || ageValue > 100) {
                return 'Please enter a valid age (1-100 years)';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
