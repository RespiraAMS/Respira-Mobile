import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../models/new_password_form_state.dart';
import '../providers/new_password_controller.dart';
import '../widgets/brand_header_widget.dart';
import '../widgets/password_requirement_widget.dart';
import '../routes.dart';

/// Route `/new-password` — password-reset step 2/2: set a new password.
class NewPasswordScreen extends ConsumerWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(newPasswordControllerProvider);
    final controller = ref.read(newPasswordControllerProvider.notifier);
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
                      const BrandHeaderWidget(),
                      const SizedBox(height: Spacing.section + 4),
                      Text(
                        'Tạo mật khẩu mới',
                        style: TypographyTokens.h1(
                          context,
                        ).copyWith(color: c.textPrimary),
                      ),
                      const SizedBox(height: Spacing.inline),
                      AppText(
                        'Chọn mật khẩu mạnh để bảo vệ dữ liệu bệnh nhân và phiên làm việc.',
                      ),
                      const SizedBox(height: Spacing.section),
                      AppTextField(
                        label: 'Mật khẩu mới',
                        initialValue: form.password,
                        onChanged: controller.setPassword,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: Spacing.group),
                      AppTextField(
                        label: 'Xác nhận mật khẩu',
                        initialValue: form.confirmPassword,
                        onChanged: controller.setConfirmPassword,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(height: Spacing.section),
                      AppSurface(
                        radius: AppRadius.lgValue,
                        color: c.surfaceSecondary,
                        borderColor: Colors.transparent,
                        padding: const EdgeInsets.all(Spacing.group),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mật khẩu cần có',
                              style: TypographyTokens.body(
                                context,
                              ).copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: Spacing.control - 4),
                            PasswordRequirementWidget(
                              label: 'Tối thiểu 8 ký tự',
                              met: form.hasMinLength,
                            ),
                            const SizedBox(height: Spacing.inline - 4),
                            PasswordRequirementWidget(
                              label: 'Ít nhất 1 chữ in hoa',
                              met: form.hasUppercase,
                            ),
                            const SizedBox(height: Spacing.inline - 4),
                            PasswordRequirementWidget(
                              label: 'Ít nhất 1 số hoặc ký tự đặc biệt',
                              met: form.hasDigitOrSpecial,
                            ),
                          ],
                        ),
                      ),
                      if (!form.passwordsMatch &&
                          form.confirmPassword.isNotEmpty) ...[
                        const SizedBox(height: Spacing.control),
                        // Error never relies on color alone (§12).
                        Text(
                          'Mật khẩu xác nhận chưa khớp.',
                          style: TypographyTokens.caption(
                            context,
                          ).copyWith(color: c.error),
                        ),
                      ],
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: Spacing.inline),
                        child: Column(
                          children: [
                            AppButton(
                              label: 'Cập nhật mật khẩu',
                              expand: true,
                              onPressed: form.canSubmit
                                  ? () => context.push(
                                      AuthenticationRoutes.passwordResetSuccess,
                                    )
                                  : null,
                            ),
                            const SizedBox(height: Spacing.control),
                            AppButton(
                              label: 'Hủy và quay lại',
                              type: AppButtonType.secondary,
                              expand: true,
                              onPressed: () =>
                                  context.goBackOr(AuthenticationRoutes.login),
                            ),
                          ],
                        ),
                      ),
                      AppText(
                        'Bước 2/2 · Thiết lập mật khẩu',
                        type: AppTextType.caption,
                        color: c.textTertiary,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: Spacing.inline),
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
