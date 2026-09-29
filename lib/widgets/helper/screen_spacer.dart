import 'package:flutter/material.dart';

class ScreenSpacer extends StatelessWidget {
  const ScreenSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(child: CustomSpacer.L());
  }
}

class CustomSpacer extends StatelessWidget {
  final double space;
  const CustomSpacer.xL({super.key, this.space = 24.0});
  const CustomSpacer.L({super.key, this.space = 16.0});
  const CustomSpacer.M({super.key, this.space = 12.0});
  const CustomSpacer.S({super.key, this.space = 8.0});
  const CustomSpacer.xS({super.key, this.space = 4.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}
