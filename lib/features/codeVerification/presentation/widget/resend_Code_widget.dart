import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';

class ResendCodeWidget extends StatefulWidget {
  const ResendCodeWidget({
    super.key,
    required this.onResend,
    this.duration = const Duration(minutes: 3),
  });

  final Duration duration;

  final Future<void> Function() onResend;

  @override
  State<ResendCodeWidget> createState() => ResendCodeWidgetState();
}

class ResendCodeWidgetState extends State<ResendCodeWidget> {
  Timer? _timer;
  late Duration _remaining;
  bool _isResending = false;

  @override
  void initState() {
    super.initState();
    _remaining = widget.duration;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _remaining = widget.duration);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining.inSeconds <= 0) {
        timer.cancel();
        return;
      }
      setState(() => _remaining -= const Duration(seconds: 1));
    });
  }

  void restart() => _startTimer();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formatted {
    final minutes =
        _remaining.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds =
        _remaining.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Future<void> _handleResend() async {
    if (_remaining.inSeconds > 0 || _isResending) return;
    setState(() => _isResending = true);

    await widget.onResend();

    if (!mounted) return;
    setState(() => _isResending = false);
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = context.t;
    final canResend = _remaining.inSeconds <= 0;

    if (_isResending) {
      return SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(strokeWidth: 2, color: colors.accent),
      );
    }

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        tr.resendIn(_formatted),
        style: AppTextStyles.inlineLinkText(
            context: context, color: colors.accent),
      ),
      if (!canResend)
        Text(
          tr.sendCode,
          style: AppTextStyles.b12(color: colors.text3),
        ),
    ]);
  }
}
