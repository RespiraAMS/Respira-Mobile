import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../design_system/design_system.dart';
import '../providers/login_controller.dart';
import '../widgets/brand_header_widget.dart';
import '../routes.dart';

/// Route `/login` — email/staff-code sign-in.
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);
    final c = context.respiraColors;

    void submit() {
      if (!controller.canSubmit) {
        showAppToast(context, 'Vui lòng nhập email/mã nhân viên và mật khẩu.');
        return;
      }
      // Repository-backed auth lands with the networking layer; the
      // welcome screen is the post-login landing page.
      context.go('/welcome');
    }

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
                      const BrandHeaderWidget(),
                      const SizedBox(height: Spacing.section + 4),
                      Text(
                        'Đăng nhập',
                        style: TypographyTokens.h1(
                          context,
                        ).copyWith(color: c.textPrimary),
                      ),
                      const SizedBox(height: Spacing.inline),
                      AppText('Tiếp tục vào không gian làm việc RespiraAMS.'),
                      const SizedBox(height: Spacing.section),
                      AppTextField(
                        label: 'Email hoặc mã nhân viên',
                        initialValue: form.identifier,
                        onChanged: controller.setIdentifier,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        hintText: 'bs.minh@respira.vn',
                      ),
                      const SizedBox(height: Spacing.group),
                      AppTextField(
                        label: 'Mật khẩu',
                        initialValue: form.password,
                        onChanged: controller.setPassword,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        hintText: '••••••••',
                      ),
                      const SizedBox(height: Spacing.inline),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AppLinkText(
                          'Quên mật khẩu?',
                          onPressed: () =>
                              context.push(AuthenticationRoutes.forgotPassword),
                        ),
                      ),
                      const SizedBox(height: Spacing.block - 4),
                      AppButton(
                        label: 'Đăng nhập',
                        expand: true,
                        onPressed: submit,
                      ),
                      const SizedBox(height: Spacing.section),
                      _DividerWithLabel(label: 'hoặc'),
                      const SizedBox(height: Spacing.control),
                      AppButton(
                        label: 'Dùng mã nhân viên',
                        type: AppButtonType.outline,
                        expand: true,
                        // Staff-code sign-in flow is not designed yet.
                        onPressed: () => showAppToast(
                          context,
                          'Đăng nhập bằng mã nhân viên sẽ được bổ sung sau.',
                        ),
                      ),
                      const SizedBox(height: Spacing.section),
                      AppSurface(
                        radius: AppRadius.lgValue,
                        color: c.surfaceSecondary,
                        borderColor: Colors.transparent,
                        padding: const EdgeInsets.all(Spacing.group),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: ControlSize.touchTargetMin,
                              height: ControlSize.touchTargetMin,
                              decoration: BoxDecoration(
                                color: c.primarySoft,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                LucideIcons.shieldCheck,
                                size: ControlSize.iconLg,
                                color: c.primary,
                              ),
                            ),
                            const SizedBox(width: Spacing.control + 4),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Phiên đăng nhập an toàn',
                                    style: TypographyTokens.body(
                                      context,
                                    ).copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: Spacing.xxs - 4),
                                  AppText(
                                    'Tự động khóa khi không hoạt động và bảo vệ theo vai trò.',
                                    type: AppTextType.caption,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: Spacing.inline),
                        child: AppText(
                          'Cần hỗ trợ? Liên hệ quản trị viên bệnh viện.',
                          type: AppTextType.caption,
                          color: c.textTertiary,
                          textAlign: TextAlign.center,
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

class _DividerWithLabel extends StatelessWidget {
  const _DividerWithLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Row(
      children: [
        Expanded(child: Container(height: 1, color: c.borderSubtle)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.control),
          child: Text(
            label,
            style: TypographyTokens.caption(
              context,
            ).copyWith(color: c.textTertiary),
          ),
        ),
        Expanded(child: Container(height: 1, color: c.borderSubtle)),
      ],
    );
  }
}
