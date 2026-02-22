import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["Men", "Women", "Shoes", "Accessories"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Categories", style: AppTextStyles.heading2),

        SizedBox(height: 16.h),

        SizedBox(
          height: 40.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: index == 0 ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: index == 0 ? Colors.white : Colors.black,
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}
