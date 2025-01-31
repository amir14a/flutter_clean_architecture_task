import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/page/user_details_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserDetailsPage(),
    );
  }
}
