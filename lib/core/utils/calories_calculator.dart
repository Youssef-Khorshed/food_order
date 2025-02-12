class CalorieCalculator {
  static double calculateCalories({
    required double weightKg,
    required double heightCm,
    required int ageYears,
    required String gender,
  }) {
    if (gender == 'Male') {
      return 66.47 +
          (13.75 * weightKg) +
          (5.003 * heightCm) -
          (6.755 * ageYears);
    } else {
      return 655.1 + (9.56 * weightKg) + (1.85 * heightCm) - (4.67 * ageYears);
    }
  }
}
