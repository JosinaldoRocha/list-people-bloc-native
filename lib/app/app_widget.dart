import 'package:flutter/material.dart';
import 'app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de pessoas - Bloc nativo',
      initialRoute: '/home',
      routes: AppRoutes.all,
    );
  }
}
