// lib/screens/medical_lookup_screen.dart
import 'package:flutter/material.dart';
import './models/lookup_models.dart';
import './widgets/lookup_widgets.dart';

class MedicalLookupScreen extends StatelessWidget {
  const MedicalLookupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 22),
              // App Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 24, color: Color(0xFF0F1419)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "Tra cứu",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F1419),
                        ),
                      ),
                      Text(
                        "Tài liệu y tế dành cho bác sĩ",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF536471),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Search Input
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF3F4),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, size: 20, color: Color(0xFF536471)),
                    SizedBox(width: 12),
                    Text(
                      "Tìm thuốc, vi khuẩn, bệnh lý...",
                      style: TextStyle(fontSize: 15, color: Color(0xFF536471)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Section: Danh mục
              const Text(
                "Danh mục",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF0F1419)),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 12,
                  childAspectRatio: 171 / 112,
                ),
                itemCount: mockCategories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(category: mockCategories[index]);
                },
              ),
              const SizedBox(height: 24),
              // Section: Đã xem gần đây
              const Text(
                "Đã xem gần đây",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF0F1419)),
              ),
              const SizedBox(height: 12),
              ...mockRecents.map((item) => RecentItemCard(item: item)).toList(),
              const SizedBox(height: 100), // Khoảng trống cho Bottom Nav
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar (Design tĩnh theo Figma)
      bottomNavigationBar: Container(
        height: 76,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 18, offset: Offset(0, 4))],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.people_outline, "Bệnh nhân", false),
            _buildNavItem(Icons.search, "Tra cứu", true), // Active item
            _buildNavItem(Icons.medical_services_outlined, "Chẩn đoán", false),
            _buildNavItem(Icons.calculate_outlined, "Máy tính", false),
            _buildNavItem(Icons.bar_chart_outlined, "Thống kê", false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    final color = isActive ? const Color(0xFF1D9BF0) : const Color(0xFF536471);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFE8F5FD) : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22, color: color),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 9, fontWeight: isActive ? FontWeight.w600 : FontWeight.normal, color: color)),
        ],
      ),
    );
  }
}