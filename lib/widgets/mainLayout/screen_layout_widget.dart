import 'package:flutter/material.dart';

class ScreenLayoutWidget extends StatefulWidget {
  final List<Widget> children;
  final double verPadding;

  const ScreenLayoutWidget({
    super.key,
    this.verPadding = 40,
    required this.children,
  });

  @override
  State<ScreenLayoutWidget> createState() => _ScreenLayoutWidgetState();
}

class _ScreenLayoutWidgetState extends State<ScreenLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.symmetric(
          vertical: widget.verPadding,
        ),
        child: RawScrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          child: CustomScrollView(
            slivers: widget.children,
          ),
        ));
  }
}
