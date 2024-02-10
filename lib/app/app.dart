

import 'package:flutter/material.dart';

import '../screeen/home_page.dart';

class CatApp extends StatelessWidget {
  const CatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
