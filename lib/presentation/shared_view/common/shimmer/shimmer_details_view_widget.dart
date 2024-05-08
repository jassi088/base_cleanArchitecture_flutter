import 'package:flutter/material.dart';

import '../../../presentation.dart';

class ShimmerDetailsViewWidget extends StatelessWidget {
  const ShimmerDetailsViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainerWidget(
      colors: AppColors.backgroundGradient,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SafeArea(
            child: CommonAppBar(
              title: const ShimmerContainerEffectWidget(
                width: 130,
                height: 15,
                margin: EdgeInsets.only(top: 10),
              ),
            ),
          ),
          const ShimmerDetailsViewBodyWidget(),
        ],
      ),
    );
  }
}
