import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class ProductInfoSection extends StatelessWidget {
  final String title;
  final String category;
  final double price;
  final String description;

  const ProductInfoSection({
    super.key,
    required this.title,
    required this.category,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.heading1),
                  SizedBox(height: 4.h),
                  Text(
                    category,
                    style: AppTextStyles.body.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Text(
              "\$$price",
              style: AppTextStyles.heading1.copyWith(
                color: AppColors.primary,
                fontSize: 24.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Text("Description", style: AppTextStyles.heading2),
        SizedBox(height: 12.h),
        Text(
          description,
          style: AppTextStyles.body.copyWith(
            height: 1.6,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
