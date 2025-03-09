import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/widget/app_primary_button.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_main_app.dart';

void main() {
  group('AppPrimaryButton widget tests:', () {
    testWidgets('Button should display correct text when isLoading is false', (tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 1920));
      await tester
          .pumpWidget(mockMainApp(child: AppPrimaryButton(text: 'test text', onTap: () {}, isLoading: false)));
      expect(find.text('test text'), findsOneWidget);
    });
    testWidgets('Button shouldn\'t display any text when isLoading is true', (tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 1920));
      await tester
          .pumpWidget(mockMainApp(child: AppPrimaryButton(text: 'test text', onTap: () {}, isLoading: true)));
      expect(find.byType(Text), findsNothing);
    });
    testWidgets('Button should call its callback function after tap', (tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 1920));
      final completer = Completer();
      await tester.pumpWidget(mockMainApp(
        child: AppPrimaryButton(text: 'test text', onTap: completer.complete),
      ));
      expect(completer.isCompleted, isFalse);

      await tester.tap(find.byType(AppPrimaryButton));
      expect(completer.isCompleted, isTrue);
    });
  });
}
