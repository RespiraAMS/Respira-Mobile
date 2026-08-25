import 'package:flutter/material.dart';

import '../../primitives/app_text.dart';
import '../../theme/theme_extensions.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';

/// Segmented control for views of the same context (§09.9).
///
/// Active state = text color change + solid surface indicator (never color
/// alone). Transition uses the fast 150ms duration (§13).
class AppSegmentedTabs<T> extends StatelessWidget {
  const AppSegmentedTabs({
    super.key,
    required this.segments,
    required this.selected,
    required this.onChanged,
  });

  final List<(T value, String label)> segments;
  final T selected;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      padding: const EdgeInsets.all(Spacing.xxs),
      decoration: BoxDecoration(
        color: c.surfaceSecondary,
        borderRadius: AppRadius.md,
      ),
      child: Row(
        children: [
          for (final (value, label) in segments) ...[
            Expanded(
              child: _Segment(
                label: label,
                active: value == selected,
                onTap: () => onChanged(value),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Material(
      color: active ? c.surface : Colors.transparent,
      borderRadius: AppRadius.sm,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.sm,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          child: AppText(
            label,
            type: AppTextType.label,
            color: active ? c.primary : c.textSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
