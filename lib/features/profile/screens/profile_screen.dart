import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_text_styles.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text("Profile", style: AppTextStyles.heading2),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const ProfileHeader(),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.person_outline,
                    title: "My Account",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.shopping_bag_outlined,
                    title: "My Orders",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.location_on_outlined,
                    title: "Shipping Address",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.payment_outlined,
                    title: "Payment Methods",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.settings_outlined,
                    title: "Settings",
                    onTap: () {},
                  ),
                  const Divider(indent: 20, endIndent: 20),
                  ProfileMenuItem(
                    icon: Icons.logout,
                    title: "Logout",
                    isLogout: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
