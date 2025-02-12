import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order/core/Extension/navigation.dart';
import 'package:food_order/core/Routes/routes.dart';
import 'package:food_order/core/utils/calories_calculator.dart';
import 'package:food_order/core/utils/calories_form.dart';
import 'package:food_order/core/utils/custom_app_button.dart';
import 'package:food_order/core/utils/custom_appbar.dart';
import 'package:food_order/core/style/styles.dart';
import 'package:food_order/core/theme/colors.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController weight = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController age = TextEditingController();
  String? selectedGender;
  String? calorieResult;

  bool get isFormValid =>
      weight.text.isNotEmpty &&
      height.text.isNotEmpty &&
      age.text.isNotEmpty &&
      selectedGender != null;

  @override
  void initState() {
    super.initState();
    weight.addListener(_onFormChanged);
    height.addListener(_onFormChanged);
    age.addListener(_onFormChanged);
  }

  void _onFormChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    weight.dispose();
    height.dispose();
    age.dispose();
    super.dispose();
  }

  void onGenderChanged(String? gender) {
    if (gender != null) {
      setState(() {
        selectedGender = gender;
      });
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final weightValue = double.parse(weight.text);
      final heightValue = double.parse(height.text);
      final ageValue = int.parse(age.text);

      final calories = CalorieCalculator.calculateCalories(
        weightKg: weightValue,
        heightCm: heightValue,
        ageYears: ageValue,
        gender: selectedGender!,
      );

      setState(() {
        calorieResult =
            'Your daily calorie needs: ${calories.toStringAsFixed(2)} calories';
      });
      context.pushNamed(Routes.createOrder);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBackground,
      appBar: customAppBar("Enter your details"),
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.w, right: 24.w, bottom: 58.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CalorieForm(
                  formKey: _formKey,
                  weightController: weight,
                  heightController: height,
                  ageController: age,
                  selectedGender: selectedGender,
                  onGenderChanged: onGenderChanged,
                  calorieResult: calorieResult,
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomAppBottom(
                    title: "Next",
                    btnWidth: 327.w,
                    btnheight: 60.h,
                    txtstyle: isFormValid
                        ? AppStyle.style16w400NeutralWhite
                        : AppStyle.style16w500NeutralGray2,
                    btnColor: isFormValid
                        ? AppColor.vibrantOrange
                        : AppColor.softBackground,
                    withIcon: false,
                    onTap: isFormValid ? _handleSubmit : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
