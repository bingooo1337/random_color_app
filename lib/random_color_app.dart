import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_color_app/di/dependencies.dart';
import 'package:random_color_app/page/home_page.dart';

class RandomColorApp extends StatelessWidget {
  const RandomColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Color App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 22),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 22),
          titleMedium: TextStyle(fontSize: 16),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => Dependencies.getBackgroundColor(),
        child: const HomePage(),
      ),
    );
  }
}
