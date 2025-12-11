import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/home/data/destinations_data.dart';
import 'package:user_inter_face_2/features/home/widgets/destination_card.dart';
import 'package:user_inter_face_2/features/home/widgets/home_header.dart';
import 'package:user_inter_face_2/features/home/widgets/search_bar_widget.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.flight_takeoff, color: AppColors.primaryColor, size: 28),
            Gap(8),
            CustemText(
              text: 'رحالة',
              color: Colors.black87,
              size: 24,
              weight: FontWeight.bold,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.black87,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('الإشعارات'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            color: Colors.black87,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('الملف الشخصي'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            const HomeHeader(),

            // Search Bar Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SearchBarWidget(),
            ),

            const Gap(24),

            // Popular Destinations Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'الوجهات الشائعة',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('عرض الكل'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Text(
                      'عرض الكل',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Destinations Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: DestinationsData.popularDestinations.length,
                itemBuilder: (context, index) {
                  final destination =
                      DestinationsData.popularDestinations[index];
                  return DestinationCard(
                    destination: destination,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'تم اختيار ${destination.cityName}, ${destination.countryName}',
                          ),
                          duration: const Duration(seconds: 2),
                          backgroundColor: AppColors.primaryColor,
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
