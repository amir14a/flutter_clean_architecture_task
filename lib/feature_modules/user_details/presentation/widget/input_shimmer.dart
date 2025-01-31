import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class InputShimmer extends StatelessWidget {
  const InputShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.grey,
      period: Duration(milliseconds: 700),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: kMinInteractiveDimension,
          ),
        ),
      ),
    );
  }
}
