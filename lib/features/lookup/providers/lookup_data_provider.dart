import 'package:lucide_icons/lucide_icons.dart';
import '../models/lookup_category.dart';
import '../models/recent_item.dart';

class LookupDataProvider {
  static const List<LookupCategory> categories = [
    LookupCategory(title: 'Nhóm kháng sinh', subtitle: 'Phân loại và mô tả', icon: LucideIcons.layers),
    LookupCategory(title: 'Kháng sinh', subtitle: 'Liều dùng và phổ tác dụng', icon: LucideIcons.pill),
    LookupCategory(title: 'Tác nhân gây bệnh', subtitle: 'Mô tả và độ nhạy', icon: LucideIcons.bug),
    // LookupCategory(title: 'Phác đồ điều trị', subtitle: 'Theo bệnh và mức độ', icon: LucideIcons.clipboardList),
    LookupCategory(title: 'Kháng sinh đồ', subtitle: 'S / I / R và MIC', icon: LucideIcons.flaskConical),
    LookupCategory(title: 'Bệnh lý', subtitle: 'Tiêu chí và ICU score', icon: LucideIcons.activity),
  ];

  static const List<RecentItem> recentItems = [
    RecentItem(title: 'Ceftriaxone', subtitle: 'Cephalosporin thế hệ 3', tag: 'Thuốc'),
    RecentItem(title: 'Viêm phổi cộng đồng', subtitle: '5 tiêu chí đánh giá', tag: 'Bệnh'),
  ];
}