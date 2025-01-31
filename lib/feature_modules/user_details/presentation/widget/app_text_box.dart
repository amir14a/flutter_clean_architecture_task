import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_task/common/styles/colors.dart';
import 'package:flutter_clean_architecture_task/common/styles/text_styles.dart';

class AppTextBox extends StatelessWidget {
  final String text;

  const AppTextBox({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: LOCKED_INPUT_BACKGROUND,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4, spreadRadius: 4)]),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: kMinInteractiveDimension,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text(text, style: TEXT_STYLE_NORMAL)),
                Icon(Icons.lock, color: TEXT_NORMAL, size: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
