import 'package:flutter/material.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/auth/pages/profile_page.dart';
import 'package:user_inter_face_2/features/home/pages/home_page.dart';

class Rote extends StatefulWidget {
  const Rote({super.key});

  @override
  State<Rote> createState() => _RoteState();
}

class _RoteState extends State<Rote> {
  late PageController? controller = PageController();
  late List<Widget> screans;
  int current_screan = 0;
  @override
  void initState() {
    screans = [HomePage(), ProfilePage()];
    controller = PageController(initialPage: current_screan);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: screans,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          

          currentIndex: current_screan,
          onTap: (index) {
            setState(() {
              current_screan = index;
            });
            controller!.jumpToPage(current_screan);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
