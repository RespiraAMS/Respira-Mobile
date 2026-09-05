import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// Six rendered OTP boxes driven by one hidden [TextField].
///
/// Focus ring (primary, 2px) sits on the *current* slot — the next empty
/// box — advancing with each keystroke and moving back on backspace. Once
/// the code is complete the ring is cleared.
class OtpInputWidget extends StatefulWidget {
  const OtpInputWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.boxCount = 6,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final int boxCount;

  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant OtpInputWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      // Defer the sync: assigning during a notification pass crashes
      // EditableText. Happens only on external resets (e.g. resend).
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _controller.text != widget.value) {
          _controller.value = TextEditingValue(
            text: widget.value,
            selection: TextSelection.collapsed(offset: widget.value.length),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    final digits = widget.value;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Rendered boxes — pointer events go to the hidden field below.
        IgnorePointer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < widget.boxCount; i++)
                _OtpBox(
                  digit: i < digits.length ? digits[i] : null,
                  isFocused: i == digits.length && digits.length < widget.boxCount,
                  focusColor: c.primary,
                  borderColor: c.borderSubtle,
                  textColor: c.textPrimary,
                  fillColor: c.surface,
                ),
            ],
          ),
        ),
        // Hidden capture field stretched over the boxes.
        Positioned.fill(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: (value) =>
                widget.onChanged(value.replaceAll(RegExp(r'\D'), '')),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(widget.boxCount),
            ],
            autofocus: true,
            showCursor: false,
            // Fully transparent but with a valid font size (fontSize 0
            // trips StrutStyle assertions).
            style: TextStyle(color: Colors.transparent, fontSize: 16),
            cursorColor: Colors.transparent,
            decoration: const InputDecoration(
              border: InputBorder.none,
              isCollapsed: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}

class _OtpBox extends StatelessWidget {
  const _OtpBox({
    required this.digit,
    required this.isFocused,
    required this.focusColor,
    required this.borderColor,
    required this.textColor,
    required this.fillColor,
  });

  final String? digit;
  final bool isFocused;
  final Color focusColor;
  final Color borderColor;
  final Color textColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 54,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: AppRadius.sm,
        border: Border.all(
          color: isFocused ? focusColor : borderColor,
          width: isFocused ? 2 : 1,
        ),
      ),
      child: Text(
        digit ?? '',
        style: TypographyTokens.h2(context).copyWith(color: textColor),
      ),
    );
  }
}
