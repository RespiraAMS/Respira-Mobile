import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../design_system/design_system.dart';
import '../routes.dart';
import '../widgets/brand_header_widget.dart';

/// Route `/splash` — brand intro; advances to `/login` automatically.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const _autoAdvanceAfter = Duration(seconds: 2);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(_autoAdvanceAfter, () {
      if (mounted) context.go(AuthenticationRoutes.login);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.group),
          child: Column(
            children: [
              const Spacer(flex: 3),
              RespiraLogoMarkWidget(size: 96),
              const SizedBox(height: Spacing.xl),
              Text(
                'RespiraAMS',
                style: TypographyTokens.h1(
                  context,
                ).copyWith(color: c.textPrimary),
              ),
              const SizedBox(height: Spacing.inline),
              AppText(
                'Clinical workspace for respiratory care',
                type: AppTextType.caption,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 4),
              // Page indicator dots (template: soft · primary · soft).
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Dot(size: 8, color: c.primarySoft),
                  const SizedBox(width: Spacing.inline),
                  _Dot(size: 10, color: c.primary),
                  const SizedBox(width: Spacing.inline),
                  _Dot(size: 8, color: c.primarySoft),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
