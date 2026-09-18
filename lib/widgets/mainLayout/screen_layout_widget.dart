import 'package:flutter/material.dart';

class ScreenLayoutWidget extends StatefulWidget {
  final List<Widget> children;
  final String? currentPath;

  const ScreenLayoutWidget(
      {super.key, required this.children, this.currentPath});

  @override
  State<ScreenLayoutWidget> createState() => _ScreenLayoutWidgetState();
}

class _ScreenLayoutWidgetState extends State<ScreenLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      child: CustomScrollView(
        slivers: widget.children,
      ),
    );
  }
}
