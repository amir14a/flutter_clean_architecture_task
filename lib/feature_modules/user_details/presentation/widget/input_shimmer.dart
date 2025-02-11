import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_task/common/config/app_configs.dart';
import 'package:shimmer/shimmer.dart';

class InputShimmer extends StatelessWidget {
  const InputShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.grey,
        period: APP_ANIMATION_DURATION,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: double.infinity,
              minHeight: kMinInteractiveDimension,
            ),
          ),
        ),
      ),
    );
  }
}
