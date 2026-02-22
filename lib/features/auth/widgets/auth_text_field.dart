import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? maxLength;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator?.call(value ?? ""),
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLength: maxLength,
      buildCounter:
          (context, {required currentLength, required isFocused, maxLength}) {
            if (maxLength == null) return const SizedBox();
            return Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                "$currentLength/$maxLength",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: isFocused
                      ? AppColors.primary
                      : AppColors.textSecondary,
                ),
              ),
            );
          },
      decoration: InputDecoration(
        labelText: label,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.s16.w,
          vertical: AppSpacing.s16.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r12),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r12),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r12),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
