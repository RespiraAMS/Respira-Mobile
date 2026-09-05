import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../models/otp_state.dart';
import '../providers/otp_controller.dart';
import '../widgets/brand_header_widget.dart';
import '../widgets/otp_input_widget.dart';
import '../routes.dart';

/// Route `/otp-verification` — password-reset step 1/2: verify identity.
class OtpVerificationScreen extends ConsumerWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otp = ref.watch(otpControllerProvider);
    final controller = ref.read(otpControllerProvider.notifier);
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
                      const SizedBox(height: Spacing.section),
                      // Overlapping avatars inside a soft pill (template
                      // decoration; network images replaced by glyphs).
                      Center(
                        child: Container(
                          height: 64,
                          padding: const EdgeInsets.symmetric(
                            horizontal: Spacing.group,
                          ),
                          decoration: BoxDecoration(
                            color: c.primarySoft,
                            borderRadius: AppRadius.full,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AvatarGlyphWidget(glyph: '👨🏻', size: 44),
                              Transform.translate(
                                offset: const Offset(-12, 0),
                                child: AvatarGlyphWidget(
                                  glyph: '👩🏾',
                                  size: 44,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: Spacing.section),
                      Text(
                        'Nhập mã xác thực',
                        style: TypographyTokens.h1(
                          context,
                        ).copyWith(color: c.textPrimary),
                      ),
                      const SizedBox(height: Spacing.inline),
                      AppText('Mã 6 chữ số đã được gửi đến bs.m***@respira.vn'),
                      const SizedBox(height: Spacing.section),
                      OtpInputWidget(
                        value: otp.digits,
                        onChanged: controller.digitChanged,
                      ),
                      const SizedBox(height: Spacing.block - 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            otp.countdownLabel,
                            type: AppTextType.caption,
                          ),
                          if (otp.secondsRemaining == 0)
                            AppLinkText(
                              'Gửi lại mã',
                              onPressed: controller.resend,
                            )
                          else
                            Opacity(
                              opacity: 0.5,
                              child: AppLinkText('Gửi lại mã'),
                            ),
                        ],
                      ),
                      const SizedBox(height: Spacing.control + 4),
                      AppButton(
                        label: 'Xác nhận',
                        expand: true,
                        onPressed: otp.isComplete
                            ? () =>
                                  context.push(AuthenticationRoutes.newPassword)
                            : null,
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
                              'Bảo mật tài khoản',
                              style: TypographyTokens.bodyLarge(
                                context,
                              ).copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: Spacing.inline - 4),
                            AppText(
                              'Không chia sẻ mã xác thực. Mã sẽ hết hiệu lực sau 10 phút và chỉ dùng một lần.',
                              type: AppTextType.caption,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: Spacing.inline),
                        child: AppButton(
                          label: 'Đổi email nhận mã',
                          type: AppButtonType.secondary,
                          expand: true,
                          onPressed: () => context.goBackOr(
                            AuthenticationRoutes.forgotPassword,
                          ),
                        ),
                      ),
                      AppText(
                        'Bước 1/2 · Xác minh danh tính',
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
