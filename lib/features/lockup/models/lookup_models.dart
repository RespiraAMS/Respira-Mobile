import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final String subtitle;
  final IconData icon;

  CategoryModel({required this.title, required this.subtitle, required this.icon});
}

class RecentModel {
  final String title;
  final String subtitle;
  final String tag;

  RecentModel({required this.title, required this.subtitle, required this.tag});
}

final List<CategoryModel> mockCategories = [
  CategoryModel(title: "Nhóm kháng sinh", subtitle: "Phân loại và mô tả", icon: Icons.layers_outlined),
  CategoryModel(title: "Kháng sinh", subtitle: "Liều dùng và phổ tác dụng", icon: Icons.medication_outlined),
  CategoryModel(title: "Tác nhân gây bệnh", subtitle: "Mô tả và độ nhạy", icon: Icons.bug_report_outlined),
  CategoryModel(title: "Phác đồ điều trị", subtitle: "Theo bệnh và mức độ", icon: Icons.assignment_outlined),
  CategoryModel(title: "Kháng sinh đồ", subtitle: "S / I / R và MIC", icon: Icons.science_outlined),
  CategoryModel(title: "Bệnh lý", subtitle: "Tiêu chí và ICU score", icon: Icons.monitor_heart_outlined),
];

final List<RecentModel> mockRecents = [
  RecentModel(title: "Ceftriaxone", subtitle: "Cephalosporin thế hệ 3", tag: "Thuốc"),
  RecentModel(title: "Viêm phổi cộng đồng", subtitle: "5 tiêu chí đánh giá", tag: "Bệnh"),
];