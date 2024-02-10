import 'package:cat_app/app/app.dart';
import 'package:cat_app/core/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  runApp(const CatApp());
}
