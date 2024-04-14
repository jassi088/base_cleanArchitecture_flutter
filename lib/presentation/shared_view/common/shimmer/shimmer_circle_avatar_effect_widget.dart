import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircleAvatarEffectWidget extends StatelessWidget {
  const ShimmerCircleAvatarEffectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!.withOpacity(0.3),
      highlightColor: Colors.white.withOpacity(0.6),
      period: const Duration(milliseconds: 800),
      child: CircleAvatar(backgroundColor: Colors.white.withOpacity(0.9), radius: 9),
    );
  }
}
