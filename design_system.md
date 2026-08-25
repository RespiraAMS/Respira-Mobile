# RespiraAMS Mobile Design System

> **Clinical clarity, Telegram-level familiarity.**
>
> Thiết kế mobile cho bác sĩ và nhân viên y tế, ưu tiên quét thông tin
> nhanh, hành động rõ ràng và dark mode phẳng, nhất quán.
>
> Mobile only · Inner · One blue primary · Light + Dark

---

## 01 · Design Principles

- **Clear at a glance** — Tên bệnh nhân, trạng thái và nhãn tổng thể phải hiển
  thị rõ ràng ngay từ đầu.
- **One visual voice** — Bao gồm cùng hệ thống màu, typography và hierarchy
  nhất quán.
- **Grouped, not fragmented** — Các chức năng liên quan gom thành grouped card
  và Telegram Settings.
- **Calm clinical UI** — Không dùng gradient trong thẻ; tránh các viền trong có
  độ lồi. Tránh viền/đổ nổi; ưu tiên flat surface.
- **Accessible states** — Không dùng dark grey để chỉ trạng thái. Luôn có nhãn,
  icon hoặc màu để bổ trợ.
- **Clinical priority** — Ưu tiên theo thứ tự: patient identity → clinical
  status → critical value → timestamp → secondary information.
- **Source of truth** — Feature screen không tự định nghĩa màu, spacing, radius,
  typography hoặc interaction state ngoài Design System.

---

## 02 · Color System

Màu brand chính, neutral cổ điển, semantic color chỉ dùng khi có ý nghĩa
lâm sàng.

### Semantic tokens

| Token | Ý nghĩa |
|---|---|
| `background` | Nền chính của screen |
| `foreground` | Nội dung chính trên background |
| `surface` | Card / grouped surface |
| `surface-secondary` | Nested surface / vùng phụ |
| `surface-tertiary` | Vùng phụ cấp 3 khi cần |
| `primary` | Action chính / active state |
| `on-primary` | Nội dung trên primary |
| `text-primary` | Nội dung chính |
| `text-secondary` | Nội dung phụ |
| `text-tertiary` | Metadata / caption |
| `border-subtle` | Divider / border nhẹ |
| `border-default` | Border tiêu chuẩn |
| `border-strong` | Border cần nhấn mạnh |
| `icon-default` | Icon mặc định |
| `icon-muted` | Icon phụ |
| `icon-primary` | Icon primary |
| `icon-inverse` | Icon trên surface tối / primary |
| `success` | Stable |
| `warning` | Needs attention |
| `error` | High risk / lỗi |
| `info` | Information |

### Light

| Token | Value |
|---|---|
| `background` | `#F7F9F9` |
| `foreground` | `#0F1419` |
| `surface` | `#FFFFFF` |
| `surface-secondary` | `#EFF3F4` |
| `surface-tertiary` | `#E7ECEE` |
| `primary` | `#1D9BF0` |
| `on-primary` | `#FFFFFF` |
| `text-primary` | `#0F1419` |
| `text-secondary` | `#536471` |
| `text-tertiary` | `#6E7C87` |
| `border-subtle` | `#EFF3F4` |
| `border-default` | `#DCE3E6` |
| `border-strong` | `#B8C4CA` |

### Dark · Flat Surfaces

| Token | Value |
|---|---|
| `background` | `#000000` |
| `foreground` | `#FFFFFF` |
| `surface` | `#1C1C1E` |
| `surface-secondary` | `#2C2C2E` |
| `surface-tertiary` | `#38383A` |
| `primary` | `#1D9BF0` |
| `on-primary` | `#FFFFFF` |
| `text-primary` | `#FFFFFF` |
| `text-secondary` | `#8B98A5` |
| `text-tertiary` | `#A7B0B7` |
| `border-subtle` | `#2C2C2E` |
| `border-default` | `#38383A` |
| `border-strong` | `#545456` |

### Semantic states

- **Information** — Dùng cho thông tin; thanh nhấn màu xanh.
- **Stable** — Tình trạng ổn định; màu xanh lá.
- **Needs attention** — Cần theo dõi; màu vàng.
- **High risk** — Nguy cơ cao; màu đỏ.

Semantic state không được truyền đạt bằng màu duy nhất. Luôn kết hợp
label, icon hoặc text.

### Opacity

Opacity chỉ dùng cho overlay / transient surface, không dùng để làm mờ
critical clinical information.

- Light overlay: White `72%` khi cần.
- Light divider overlay: Black `8%` khi cần.
- Dark overlay: White `8%` khi cần.
- Dark divider overlay: White `16%` khi cần.
- Patient identity, critical value, alert và clinical status: `100%`.

---

## 03 · Typography

Font duy nhất là **Inter**. Ưu tiên sentence case, sử dụng nó và không dùng
weight quá nặng.

| Type | Example | Size / Line height / Weight |
|---|---|---|
| Display | `SpO₂ 93%` | 32px / 40px · Bold |
| H1 | `Bệnh nhân` | 28px / 36px · Bold |
| H2 | `Cần theo dõi` | 22px / 30px · Bold |
| H3 | `Thông tin điều trị` | 18px / 26px · Semi Bold |
| Body Large | `Nguyễn Minh Anh · 42 tuổi` | 17px / 25px · Regular |
| Body | `Chọn bệnh nhân và phương pháp phù hợp` | 15px / 23px · Regular |
| Body Medium | `Không tìm đang sử dụng` | 15px / 22px · Medium |
| Button | `Bắt đầu chẩn đoán` | 16px / 20px · Semi Bold |
| Caption | `Cập nhật lúc 13:28` | 13px / 18px · Regular |
| Label | `NEEDS ATTENTION` | 12px / 16px · Semi Bold |

Critical clinical values không được truncate nếu làm mất ý nghĩa.

---

## 04 · Spacing, Radius & Size

Hệ 4px, card bo mềm, touch target tối thiểu 44px.

### Spacing scale

| Token | Value |
|---|---:|
| `2XS` | 4px |
| `XS` | 8px |
| `SM` | 12px |
| `MD` | 16px |
| `LG` | 20px |
| `XL` | 24px |
| `2XL` | 32px |
| `3XL` | 40px |

### Radius

| Token | Value |
|---|---:|
| `SM` | 12px |
| `MD` | 16px |
| `LG` | 24px |
| `Full` | 999px |

### Control size

- **44px** — Touch target tối thiểu.
- **52px** — Button height, primary.
- **60px** — Row height, grouped list.

Không dùng gap lẻ như 14px khi không có lý do component-specific.

---

## 05 · Layout, Safe Area & Responsive Rules

### Mobile frame

- Reference frame: **390 × 844**
- Horizontal padding: **16px**
- Section gap: **24px**
- Minimum touch target: **44px**

Reference frame không phải device constraint. Production layout phải thích ứng
với kích thước màn hình thực tế.

### Safe area

Safe area là padding thiết bị của màn hình, không phải một layer Device Chrome
phủ lên UI. Root background luôn full-bleed; content và bottom navigation nằm
trong inset thiết bị.

Trong Flutter:

- Dùng `SafeArea` và/hoặc `MediaQuery.paddingOf(context)`.
- Không hard-code `52/34/32/24px` làm device inset.
- Các giá trị trong Figma chỉ là reference frame values.
- Bottom navigation phải kết thúc phía trên Home Indicator / gesture area.
- Content phải bắt đầu sau status bar / Dynamic Island.

### Responsive

Mobile là primary target. Khi width thay đổi, ưu tiên giữ:

1. Clinical hierarchy.
2. Touch target.
3. Content readability.
4. Action visibility.

Không dùng breakpoint để thay đổi semantics của component; chỉ thay đổi layout
khi cần.

---

## 06 · Semantic Spacing Rules

Dùng semantic spacing theo quan hệ nội dung, không chọn khoảng cách theo cảm giác.

| Value | Semantic |
|---:|---|
| 8px | Inline |
| 12px | Control |
| 16px | Group |
| 20px | Block |
| 24px | Section |
| 32px | Screen |

### Luật áp dụng

- Inline: icon-icon, pill-pill, dot-text.
- Control: label-input, icon container-copy.
- Group: item cùng nhóm, card trong một section.
- Block: content-action, summary-section header.
- Section: giữa các khối lớn.
- Screen: hero, onboarding, khoảng nghỉ lớn.
- Không đặt Rectangle 1px để giả khoảng cách.

---

## 07 · Iconography

- **Lucide Outline**
- Base **24px**
- Stroke **2px**
- Round cap/join
- Semantic icon color
- Hỗ trợ Light + Dark

Các size được phép: `16 / 18 / 20 / 22 / 24`.

- Không tự tạo icon nếu đã có icon tương ứng.
- Icon không thay label nếu label cần thiết để đọc hiểu.
- Icon-only action phải có semantic/accessibility label.
- Container icon có background riêng khi cần.

### Semantic icon colors

| State | Token |
|---|---|
| Default | `icon-default` |
| Muted | `icon-muted` |
| Primary | `icon-primary` |
| Inverse | `icon-inverse` |
| Success | `success` |
| Warning | `warning` |
| Error | `error` |

---

## 08 · Component Foundations

Design System dùng component source trong project theo tinh thần shadcn:
component có thể được chỉnh sửa trực tiếp, nhưng mọi visual decision phải
dựa trên token.

### Component API principles

- Variant được biểu diễn bằng enum / typed API.
- Không nhận raw color từ feature nếu không có use case đặc biệt.
- Không nhận raw spacing/radius từ feature cho component chuẩn.
- Component tự quản lý interaction state.
- Component phải hỗ trợ Light + Dark.
- Component phải có disabled state nếu interaction phù hợp.
- Component phải expose semantic accessibility label khi cần.

---

## 09 · Component Specifications

### 09.1 Button

**Variants**

- Primary
- Secondary
- Outline
- Ghost
- Destructive
- Link

**Sizes**

- Small: 40px
- Default: 44px
- Large / Primary CTA: 52px
- Icon: 44 × 44px

**States**

- Default
- Pressed
- Disabled
- Loading
- Focused

**Content**

- Text
- Leading icon + text
- Text + trailing icon
- Icon only

**Rules**

- Một action chính trong một context.
- Không đặt hai primary button cạnh nhau.
- Loading phải giữ layout ổn định, không làm button nhảy kích thước.
- Destructive action phải có text rõ ràng.

---

### 09.2 Input & Search

**Sizes**

- 44–52px

**Radius**

- 16px

**States**

- Default
- Focused
- Filled
- Error
- Disabled
- Read-only

**Slots**

- Label
- Required indicator
- Leading icon
- Input
- Trailing action
- Helper text
- Error text

**Rules**

- Form y tế cần trường rõ ràng, dễ đọc và nhập.
- Error không chỉ dùng màu đỏ; phải có text.
- Search ưu tiên gọn và có icon rõ ràng.

---

### 09.3 Card & Grouped List

- Radius: `20–24px`
- Có divider 1px khi cần phân tách row.
- Dùng cho 2–6 row liên quan trong một card.
- Tránh list dài trong một card.
- Không dùng gradient.
- Không tạo visual elevation mạnh.
- Nested information dùng `surface-secondary` hoặc `surface-tertiary`.

**Anatomy**

1. Header / identity
2. Content
3. Status / metadata
4. Optional action
5. Footer

---

### 09.4 Badge / Status

Variants:

- Information
- Stable
- Needs attention
- High risk

Mỗi badge phải có text label. Icon là bổ trợ, không thay label.

---

### 09.5 Avatar & Patient Identity

**Anatomy**

1. Avatar
2. Patient name
3. Patient metadata
4. Optional status

Patient name và clinical status phải có hierarchy cao hơn metadata.

---

### 09.6 Bottom Navigation

- Touch target tối thiểu: 44px.
- Dùng khi có nhiều khu vực điều hướng cấp cao.
- Active dùng primary blue.
- Icon + label là thành phần của navigation.
- Không chỉ dùng màu để biểu thị active.
- Hỗ trợ safe area động.

---

### 09.7 Dialog

**Anatomy**

1. Title
2. Description
3. Content
4. Actions

**Rules**

- Title phải mô tả action hoặc consequence.
- Destructive action dùng destructive variant.
- Không dùng dialog cho thông tin không cần user decision.

---

### 09.8 Sheet

- Mobile-first.
- Dùng cho contextual action / settings / secondary workflow.
- Có drag handle khi phù hợp.
- Không che critical clinical information quá lâu.
- Phải hỗ trợ dismiss rõ ràng.

---

### 09.9 Tabs / Segmented Control

- Dùng cho các view cùng một context.
- Active state phải có text/icon + visual indicator.
- Không dùng tabs cho navigation cấp cao nếu Bottom Navigation phù hợp.

---

### 09.10 Feedback

Bao gồm:

- Alert
- Snackbar / Toast
- Loading
- Skeleton
- Empty state
- Error state

Critical clinical alert không được dùng animation hoặc opacity để làm giảm
mức độ rõ ràng.

---

## 10 · Clinical Components

Đây là lớp domain-specific của RespiraAMS, nằm trên generic Design System.

### PatientHeader

- Avatar
- Patient name
- Age / metadata
- Clinical status

### ClinicalStatusBadge

- Stable
- Needs attention
- High risk

### VitalMetric

- Metric name
- Value
- Unit
- Timestamp
- Optional status

### VitalMetricCard

- Primary clinical value
- Secondary context
- Status
- Timestamp

### TreatmentSummary

- Treatment section
- Key-value rows
- Optional action

### MedicationRow

- Medication name
- Dosage / schedule
- Status
- Optional action

### ClinicalAlert

- Severity
- Title
- Supporting information
- Action nếu cần

Clinical components phải dùng generic components và semantic tokens; không tạo
một color/radius/spacing system riêng.

---

## 11 · Interaction States

Mọi interactive component phải định nghĩa state trước khi implement.

### Buttons

`default → pressed → focused → disabled → loading`

### Inputs

`empty → focused → filled → error → disabled → read-only`

### Rows

`default → pressed → selected → disabled`

### Navigation

`inactive → active → pressed → disabled`

### State rules

- Focus phải có visual indicator rõ.
- Disabled không được dùng opacity quá thấp đến mức mất readability.
- Error phải có text/icon bổ trợ.
- Selected state không chỉ dựa trên màu.
- Pressed state không được làm thay đổi layout.

---

## 12 · Accessibility

- Minimum touch target: **44 × 44px**.
- Không dùng màu là tín hiệu duy nhất.
- Error luôn có icon/text bổ trợ.
- Status luôn có text label.
- Icon-only button phải có semantic label.
- Critical clinical information không được truncate nếu mất ý nghĩa.
- Dynamic text scaling không được làm mất action chính.
- Contrast phải được kiểm tra cho text, icon và interactive states.
- Focus state phải nhìn thấy được.
- Không dùng animation để truyền đạt thông tin lâm sàng quan trọng.

---

## 13 · Motion

Định hướng **Calm clinical UI**: motion có mục đích, không trang trí.

### Duration

- Fast: `150ms`
- Default: `200ms`
- Slow: `300ms`

### Use

- Press feedback
- Sheet
- Dialog
- Tab/content transition

### Avoid

- Bouncy animation
- Excessive motion
- Decorative animation
- Animation trên critical clinical alert

---

## 14 · Dark Mode · Flat Surfaces

Dark mode dùng semantic surface riêng. Nội dung bệnh nhân, tô đỏ và cảnh báo
luôn giữ opacity 100%.

Nguyên tắc trực quan:

- Pure black background.
- Solid surface.
- Muted border.
- Không gradient.
- Không tạo hiệu ứng nổi cho surface.
- Không dùng shadow mạnh để phân cấp card.
- Nested surface dùng `surface-secondary` / `surface-tertiary`.

---

## 15 · Do / Don't

### Do

- Dùng semantic token.
- Dùng grouped card cho thông tin liên quan.
- Giữ patient identity và clinical status rõ.
- Dùng label + icon + color cho semantic state.
- Dùng dynamic Safe Area trong Flutter.
- Dùng component chuẩn thay vì custom styling ở feature.
- Giữ hierarchy nhất quán Light + Dark.

### Don't

- Không hard-code màu trong feature.
- Không dùng gap lẻ tùy ý.
- Không dùng gradient.
- Không dùng shadow/elevation mạnh.
- Không dùng màu duy nhất để biểu thị state.
- Không hard-code device inset.
- Không tạo icon riêng khi Lucide đã có icon tương ứng.
- Không đặt hai primary action cạnh nhau.
- Không nhồi quá nhiều row vào một grouped card.

---

## 16 · Component Inventory

### Primitives

- Text
- Icon
- Surface
- Divider
- Spacer
- Avatar
- Badge
- Skeleton
- Progress
- Spinner

### Form

- Button
- Icon Button
- Text Field
- Search Field
- Text Area
- Select
- Checkbox
- Radio
- Switch
- Date Picker

### Feedback

- Alert
- Snackbar / Toast
- Dialog
- Confirmation Dialog
- Loading
- Empty State
- Error State
- Skeleton

### Navigation

- App Bar
- Back Button
- Bottom Navigation
- Tabs
- Segmented Control
- Sheet
- Drawer

### Data

- List Row
- Grouped List
- Card
- Key-Value Row
- Timeline
- Table khi cần

### Clinical

- Patient Header
- Patient Identity
- Clinical Status Badge
- Vital Metric
- Vital Metric Card
- Treatment Summary
- Medication Row
- Clinical Alert

---

## 17 · Flutter Implementation Architecture

```text
lib/
└── design_system/
    ├── tokens/
    │   ├── colors.dart
    │   ├── spacing.dart
    │   ├── radius.dart
    │   ├── typography.dart
    │   └── sizes.dart
    │
    ├── theme/
    │   ├── app_theme.dart
    │   ├── light_theme.dart
    │   ├── dark_theme.dart
    │   └── theme_extensions.dart
    │
    ├── primitives/
    │   ├── app_surface.dart
    │   ├── app_text.dart
    │   └── app_icon.dart
    │
    ├── components/
    │   ├── button/
    │   ├── input/
    │   ├── card/
    │   ├── badge/
    │   ├── dialog/
    │   ├── sheet/
    │   ├── navigation/
    │   └── ...
    │
    ├── clinical/
    │   ├── patient_header.dart
    │   ├── vital_metric.dart
    │   ├── clinical_status_badge.dart
    │   └── ...
    │
    └── design_system.dart
```

### Flutter mapping

| Design System | Flutter |
|---|---|
| Color tokens | `ThemeExtension` |
| Typography | `TextTheme` + custom typography |
| Light/Dark | `ThemeData` |
| Component variants | `enum` / typed API |
| Interaction states | `WidgetState` |
| Responsive layout | `LayoutBuilder` / constraints |
| Safe area | `SafeArea` / `MediaQuery` |
| Icons | Lucide icon package / approved icon source |

### Rules

- Feature import `design_system.dart`, không import từng token tùy tiện.
- Feature không tự tạo `Color`, `BorderRadius`, `TextStyle` cho component chuẩn.
- Raw token override chỉ được phép ở component implementation.
- Generic components không chứa business logic.
- Clinical components không tạo token riêng.
- Light/Dark theme dùng cùng semantic API.

---

## 18 · Naming Convention

### Tokens

```text
color/background
color/surface
color/text-primary
color/text-secondary
color/primary
color/success
color/warning
color/error
space/xs
space/sm
space/md
radius/sm
radius/md
radius/full
```

### Flutter

```text
AppButton
AppTextField
AppCard
AppBadge
AppDialog
AppSheet
AppBottomNavigation

PatientHeader
VitalMetric
ClinicalStatusBadge
TreatmentSummary
```

Tên component phải mô tả semantics, không mô tả visual implementation.

Không dùng:

```text
BlueButton
RoundedCard
GreyText
BigInput
```

---

## 19 · Design Token → Component → Feature

Dependency direction:

```text
Tokens
  ↓
Theme
  ↓
Primitives
  ↓
Generic Components
  ↓
Clinical Components
  ↓
Features / Screens
```

Không cho dependency đi ngược.

Ví dụ:

```text
Feature
  ↓
PatientHeader
  ↓
AppCard
  ↓
AppSurface
  ↓
ThemeExtension
```

Feature không được bypass Design System để style trực tiếp.

---

## 20 · Component Gallery

Design System cần một màn hình/component gallery để kiểm tra trực tiếp trong
Flutter.

Nên có các nhóm:

- Colors
- Typography
- Buttons
- Inputs
- Cards
- Badges
- Dialogs
- Sheets
- Navigation
- Clinical components
- Light / Dark
- Interaction states
- Accessibility examples

Mỗi component phải được kiểm tra ít nhất ở:

1. Light
2. Dark
3. Default
4. Pressed / focused
5. Disabled
6. Error nếu có
7. Long text
8. Dynamic text scale nếu có text

---

## 21 · Definition of Done

Một component được xem là hoàn thành khi:

- Có design token rõ ràng.
- Có anatomy.
- Có variants cần thiết.
- Có interaction states.
- Có Light + Dark.
- Có accessibility behavior.
- Có mobile sizing.
- Có long-text behavior.
- Có component gallery example.
- Không hard-code token trong feature.
- Không tạo semantic color mới nếu token hiện tại đã đáp ứng.

---

## 22 · Design System Principles Summary

RespiraAMS Design System ưu tiên:

1. **Clinical clarity**
2. **Fast scanning**
3. **One visual voice**
4. **Flat, calm surfaces**
5. **Semantic states**
6. **Accessible interaction**
7. **Reusable components**
8. **Theme-driven implementation**
9. **Mobile-first behavior**
10. **Flutter-native implementation**
11. **Domain-specific clinical components**
12. **Source-controlled component customization theo tinh thần shadcn**
