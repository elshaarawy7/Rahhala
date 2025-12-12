import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/core/utils/go_router.dart';
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
                  content: CustemText(text: 'الإشعارات', color: Colors.white),
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
                  content: CustemText(
                    text: 'الملف الشخصي',
                    color: Colors.white,
                  ),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // Header Section
              const HomeHeader(),

              // Search Bar Section
              SearchBarWidget(),

              const Gap(24),

              // Popular Destinations Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustemText(
                    text: 'الوجهات الشائعة',
                    size: 22,
                    weight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: CustemText(
                            text: 'عرض الكل',
                            color: Colors.white,
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: CustemText(
                      text: 'عرض الكل',
                      color: AppColors.primaryColor,
                      size: 14,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Destinations Grid
              GridView.builder(
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
                      context.push(AppRouter.home_detils, extra: destination);
                    },
                  );
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
