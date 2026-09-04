import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';

class ResultAccordion extends StatefulWidget {
  final String title;
  final String summary;
  final List<Widget> children;
  
  final bool initiallyExpanded;

  const ResultAccordion({
    super.key,
    required this.title,
    required this.summary,
    required this.children,
    this.initiallyExpanded = false,
  });

  @override
  State<ResultAccordion> createState() => _ResultAccordionState();
}

class _ResultAccordionState extends State<ResultAccordion> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  void _toggleAccordion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    
    return Container(
      decoration: BoxDecoration(
        color: c.surfaceSecondary, 
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header (Clickable)
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _toggleAccordion,
              borderRadius: BorderRadius.circular(24),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(widget.title, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
                        const SizedBox(height: 4),
                        AppText(widget.summary, type: AppTextType.caption),
                      ],
                    ),
                    AnimatedRotation(
                      turns: _isExpanded ? 0.25 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      child: Icon(LucideIcons.chevronRight, color: c.iconDefault),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            alignment: Alignment.topCenter,
            child: Container(
              child: _isExpanded && widget.children.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: Spacing.xxs),
                          ...widget.children,
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}