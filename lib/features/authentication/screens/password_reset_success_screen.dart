import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../design_system/design_system.dart';
import '../widgets/brand_header_widget.dart';
import '../routes.dart';

/// Route `/password-reset-success` — terminal screen of the reset flow.
class PasswordResetSuccessScreen extends ConsumerWidget {
  const PasswordResetSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.xl),
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: Spacing.xxs),
                      const Center(child: BrandHeaderWidget()),
                      const SizedBox(height: Spacing.section + 4),
                      // Hero status circle (nested flat circles + allowed
                      // icon size instead of a 48px glyph).
                      Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: c.successSoft,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 56,
                            height: 56,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: c.surface,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              LucideIcons.checkCircle2,
                              size: ControlSize.iconXl,
                              color: c.success,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: Spacing.section),
                      Text(
                        'Mật khẩu đã được cập nhật',
                        textAlign: TextAlign.center,
                        style: TypographyTokens.h1(
                          context,
                        ).copyWith(color: c.textPrimary),
                      ),
                      const SizedBox(height: Spacing.control + 4),
                      AppText(
                        'Bạn có thể đăng nhập lại và tiếp tục công việc trên RespiraAMS.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: Spacing.section),
                      AppSurface(
                        radius: AppRadius.lgValue,
                        padding: const EdgeInsets.all(Spacing.group),
                        child: Row(
                          children: [
                            AvatarGlyphWidget(glyph: '👨🏻', size: 48),
                            const SizedBox(width: Spacing.group),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'BS. Lê Hoàng Minh',
                                    style: TypographyTokens.body(
                                      context,
                                    ).copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: Spacing.xxs - 4),
                                  AppText(
                                    'Chuyên khoa Hô hấp · Tài khoản đã xác minh',
                                    type: AppTextType.caption,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Spacing.section),
                      Container(
                        padding: const EdgeInsets.all(Spacing.group),
                        decoration: BoxDecoration(
                          color: c.primarySoft,
                          borderRadius: BorderRadius.circular(
                            AppRadius.lgValue - 4,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Không gian làm việc đã sẵn sàng',
                              style: TypographyTokens.body(
                                context,
                              ).copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: Spacing.inline - 4),
                            AppText(
                              'Dữ liệu và quyền truy cập sẽ được khôi phục sau đăng nhập.',
                              type: AppTextType.caption,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: Spacing.inline),
                        child: Column(
                          children: [
                            AppButton(
                              label: 'Đăng nhập ngay',
                              expand: true,
                              onPressed: () =>
                                  context.go(AuthenticationRoutes.login),
                            ),
                            const SizedBox(height: Spacing.control),
                            AppLinkText(
                              'Về trang chào mừng',
                              onPressed: () =>
                                  context.go(AuthenticationRoutes.welcome),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
