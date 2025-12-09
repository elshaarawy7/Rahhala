import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'مرحباً بك في رحالة',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'اكتشف وجهتك القادمة',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),
          // Search Bar (Decorative)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey[600], size: 24),
                const SizedBox(width: 12),
                Text(
                  'ابحث عن وجهتك...',
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
