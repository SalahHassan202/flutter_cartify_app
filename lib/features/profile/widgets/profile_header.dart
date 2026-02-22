import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: const AssetImage(
            "assets/images/profile/myProfile.png",
          ),
        ),
        SizedBox(height: 12.h),
        Text("Salah", style: AppTextStyles.heading2),
        SizedBox(height: 4.h),
        Text(
          "salah123@gmail.com",
          style: AppTextStyles.body.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
