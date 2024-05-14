import 'package:flutter/material.dart';
import 'package:order_food/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Order Food',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 36,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            titleMedium: TextStyle(
              fontSize: 24,
              color: Colors.black45,
              fontWeight: FontWeight.w300,
            ),
            titleSmall: TextStyle(
              fontSize: 18,
              color: Colors.black26,
            )),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
