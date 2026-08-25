import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../theme/theme_extensions.dart';
import '../../tokens/radius.dart';
import '../../tokens/sizes.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// Shows a transient feedback toast anchored at the **top** of the screen
/// (§09.10 Feedback · Snackbar/Toast).
///
/// Tokenized inverse surface (`textPrimary` bg + `background` text keeps
/// contrast correct in Light *and* Dark). Auto-dismisses after ~2.5s with a
/// calm 200ms fade/slide (§13 Default duration).
void showAppToast(BuildContext context, String message) {
  final overlay = Overlay.maybeOf(context, rootOverlay: true);
  if (overlay == null) return;

  late final OverlayEntry entry;
  entry = OverlayEntry(
    builder: (_) => _AppToastView(
      message: message,
      onDismissed: () {
        if (entry.mounted) entry.remove();
      },
    ),
  );
  overlay.insert(entry);
}

class _AppToastView extends StatefulWidget {
  const _AppToastView({required this.message, required this.onDismissed});

  final String message;
  final VoidCallback onDismissed;

  @override
  State<_AppToastView> createState() => _AppToastViewState();
}

class _AppToastViewState extends State<_AppToastView>
    with SingleTickerProviderStateMixin {
  static const _visibleFor = Duration(milliseconds: 2500);
  static const _animateFor = Duration(milliseconds: 200);

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _animateFor,
    value: 0,
  );
  late final Animation<double> _fade =
      CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  Timer? _hideTimer;
  bool _removing = false;

  @override
  void initState() {
    super.initState();
    _controller.forward();
    _hideTimer = Timer(_visibleFor, _dismiss);
  }

  void _dismiss() {
    if (_removing || !mounted) return;
    _removing = true;
    _controller.reverse().whenComplete(widget.onDismissed);
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    final topInset = MediaQuery.paddingOf(context).top;

    return Positioned(
      top: topInset + Spacing.inline,
      left: Spacing.group,
      right: Spacing.group,
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.4),
            end: Offset.zero,
          ).animate(_fade),
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.group,
                vertical: Spacing.control,
              ),
              decoration: BoxDecoration(
                color: c.textPrimary,
                borderRadius: BorderRadius.circular(AppRadius.mdValue),
              ),
              child: Row(
                children: [
                  Icon(LucideIcons.info,
                      size: ControlSize.iconSm, color: c.background),
                  const SizedBox(width: Spacing.control),
                  Expanded(
                    child: Text(
                      widget.message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TypographyTokens.caption(context)
                          .copyWith(color: c.background),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
