import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_renting/admin/create_rent/create_rent.dart';
import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
