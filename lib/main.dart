import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_task/app.dart';
import 'package:flutter_clean_architecture_task/common/di/app_service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await provideDependencies();
  runApp(const MainApp());
}

