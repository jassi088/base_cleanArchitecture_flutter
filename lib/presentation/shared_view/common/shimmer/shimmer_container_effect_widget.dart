import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainerEffectWidget extends StatelessWidget {
  const ShimmerContainerEffectWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.margin,
  });

  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[500]!.withOpacity(0.3),
      highlightColor: highlightColor ?? Colors.white.withOpacity(0.6),
      period: const Duration(milliseconds: 800),
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
      ),
    );
  }
}
