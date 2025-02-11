import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_task/common/config/app_configs.dart';
import 'package:flutter_clean_architecture_task/common/styles/colors.dart';
import 'package:flutter_clean_architecture_task/common/styles/text_styles.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  final bool disabled;

  const AppPrimaryButton({
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.disabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: APP_ANIMATION_DURATION,
      opacity: disabled ? 0.6 : 1,
      child: IgnorePointer(
        ignoring: disabled,
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: PRIMARY_COLOR,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isLoading)
                        SizedBox.square(
                          dimension: 24,
                          child: RepaintBoundary(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeCap: StrokeCap.round,
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: Text(
                            text,
                            style: TEXT_STYLE_PRIMARY_BUTTON,
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
