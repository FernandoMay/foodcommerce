import 'package:flutter/material.dart';
import 'package:foodcommerce/widgets/bottom_nav_bar.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FoodCommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFE53935)),
        useMaterial3: true,
      ),
      home: const MainBottomNavBar(),
    );
  }
}
