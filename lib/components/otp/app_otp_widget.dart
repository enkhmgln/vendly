import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_otp_model.dart';

class AppOtpWidget extends StatefulWidget {
  const AppOtpWidget({super.key, required this.model});

  final AppOtpModel model;

  @override
  State<AppOtpWidget> createState() => _AppOtpWidgetState();
}

class _AppOtpWidgetState extends State<AppOtpWidget> {
  List<Widget> _digits = [];

  @override
  void initState() {
    super.initState();
    _buildDigits();
    widget.model.controller.addListener(_buildDigits);
    widget.model.focusNode.addListener(_buildDigits);
  }

  void _buildDigits() {
    final m = widget.model;
    final value = m.value;
    final temp = <Widget>[];
    for (int i = 0; i < m.length; i++) {
      final isActive = m.focusNode.hasFocus && i == value.length;
      final char = i < value.length ? value[i] : null;
      temp.add(
        _AppOtpDigit(
          size: m.size,
          isSecure: m.isSecure,
          isCurrent: isActive,
          value: char,
        ),
      );
    }
    if (mounted) setState(() => _digits = temp);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.model.size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _digits,
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0,
              child: TextFormField(
                autofocus: widget.model.isAutoFocus,
                controller: widget.model.controller,
                focusNode: widget.model.focusNode,
                maxLength: widget.model.length,
                keyboardType: widget.model.keyboardType,
                inputFormatters:
                    widget.model.keyboardType == TextInputType.number
                    ? [FilteringTextInputFormatter.digitsOnly]
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _otpDigitRadius = 12.0;

class _AppOtpDigit extends StatelessWidget {
  const _AppOtpDigit({
    required this.size,
    required this.isSecure,
    required this.isCurrent,
    this.value,
  });

  final double size;
  final bool isSecure;
  final bool isCurrent;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final surface = cs.surfaceContainerHighest;
    final placeholderColor = cs.outline;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(_otpDigitRadius),
      ),
      child: value == null
          ? Text(
              '−',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: placeholderColor),
            )
          : isSecure
          ? Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: cs.primary,
                shape: BoxShape.circle,
              ),
            )
          : Text(
              value!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: cs.onSurface,
              ),
            ),
    );
  }
}
