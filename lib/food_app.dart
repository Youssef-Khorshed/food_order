import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:food_order/core/Routes/app_routes.dart';
import 'package:food_order/core/Routes/routes.dart';
import 'package:food_order/core/theme/colors.dart';

class Foodapp extends StatelessWidget {
  const Foodapp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ScreenUtilInit(
          designSize: constraints.maxWidth >= 600
              ? const Size(200, 912)
              : constraints.maxWidth < 390
                  ? const Size(490, 912)
                  : const Size(390, 1110),
          ensureScreenSize: true,
          minTextAdapt: true,
          builder: (context, child) => MaterialApp(
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                        seedColor: AppColor.vibrantOrange)),
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.splash,
                onGenerateRoute: AppRoutes.generateroute,
                builder: (context, widget) {
                  return DevicePreview.appBuilder(
                    context,
                    MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: widget ?? const SizedBox.shrink(),
                    ),
                  );
                },
              )),
    );
  }
}
