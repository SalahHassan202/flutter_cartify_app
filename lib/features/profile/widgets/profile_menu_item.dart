import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: isLogout
              ? Colors.red.withValues(alpha: 0.1)
              : AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(
          icon,
          color: isLogout ? Colors.red : AppColors.primary,
          size: 22.sp,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.body.copyWith(
          fontWeight: FontWeight.w600,
          color: isLogout ? Colors.red : Colors.black,
        ),
      ),
      trailing: isLogout
          ? null
          : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }
}
