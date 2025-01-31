import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_task/app.dart';
import 'package:flutter_clean_architecture_task/common/di/app_service_locator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await provideDependencies();
  runApp(const MainApp());
}

