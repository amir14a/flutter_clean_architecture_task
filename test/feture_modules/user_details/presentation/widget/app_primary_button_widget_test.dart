import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/widget/app_text_box.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_main_app.dart';

void main() {
  group('AppTextBox widget tests:', () {
    testWidgets('Should display correct text when isLoading is false', (tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 1920));
      await tester.pumpWidget(mockMainApp(child: AppTextBox(text: 'test text')));
      expect(find.text('test text'), findsOneWidget);
    });
    testWidgets('AppTextBox should have a row to expand the width', (tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 1920));
      await tester.pumpWidget(mockMainApp(child: AppTextBox(text: 'test text')));
      expect(find.byType(Row), findsOneWidget);
    });
  });
}
