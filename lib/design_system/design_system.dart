/// RespiraAMS Design System — single public entry point.
///
/// Features import this barrel only (§17 Rules): never raw tokens files,
/// never hand-made colors/radii/text styles for standard components.
library;

export 'tokens/colors.dart';
export 'tokens/radius.dart';
export 'tokens/sizes.dart';
export 'tokens/spacing.dart';
export 'tokens/typography.dart';

export 'theme/app_theme.dart';
export 'theme/dark_theme.dart';
export 'theme/light_theme.dart';
export 'theme/theme_extensions.dart';

export 'primitives/app_avatar_glyph.dart';
export 'primitives/app_icon.dart';
export 'primitives/app_surface.dart';
export 'primitives/app_text.dart';

export 'components/button/app_button.dart';
export 'components/card/app_card.dart';
export 'components/dialog/app_dialog.dart';
export 'components/feedback/app_toast.dart';
export 'components/input/app_text_field.dart';
export 'components/navigation/app_app_bar.dart';
export 'components/tabs/app_segmented_tabs.dart';
export 'components/text/app_link_text.dart';

export 'clinical/clinical_alert.dart';
export 'clinical/patient_header.dart';
