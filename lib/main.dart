import 'package:big_news/controller/internet_connection_controller.dart';
import 'package:big_news/controller/shared_preferences_controller.dart';
import 'package:big_news/providers/category_provider.dart';
import 'package:big_news/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController().initCache();
  runApp(const MyApp());
  Get.put<InternetConnectionController>(InternetConnectionController(),
      permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => CategoryProvider(),
        child: GetMaterialApp(
          theme: ThemeData.dark().copyWith(
            textTheme: TextTheme(
              displayLarge: const TextStyle(fontFamily: 'Newtype'),
              titleSmall: TextStyle(
                fontFamily: 'Newtype',
                fontSize: 24.sp,
              ),
              titleMedium: TextStyle(
                fontFamily: 'Newtype',
                fontSize: 18.sp,
                color: Colors.grey[300],
              ),
              bodyLarge: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Newtype',
                fontWeight: FontWeight.w100,
              ),
              bodyMedium: TextStyle(
                fontSize: 12.sp,
                wordSpacing: 2,
                fontWeight: FontWeight.w400,
              ),
              displaySmall: TextStyle(
                fontSize: 10.sp,
                color: Colors.grey[300],
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w300,
              ),
              titleLarge: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Newtype',
              ),
              bodySmall: TextStyle(
                fontSize: 10.sp,
                color: Colors.grey[300]!,
              ),
            ),
          ),
          title: 'BigNews',
          home: const Splashscreen(),
        ),
      ),
    );
  }
}
