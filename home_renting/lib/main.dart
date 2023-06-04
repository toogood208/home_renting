import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
          primarySwatch: Colors.blue,
        ),
     navigatorKey: StackedService.navigatorKey,
     onGenerateRoute: StackedRouter().onGenerateRoute,
       
      );
    });
  }
}
