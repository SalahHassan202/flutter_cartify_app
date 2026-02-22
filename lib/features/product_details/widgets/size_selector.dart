import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int selectedIndex = 1;
  final List<String> sizes = ["S", "M", "L", "XL"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Size", style: AppTextStyles.heading2),
        SizedBox(height: 16.h),
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              bool isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 60.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : Colors.grey.shade300,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    sizes[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
