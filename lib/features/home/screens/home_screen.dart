import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_banner.dart';
import '../widgets/category_list.dart';
import '../widgets/product_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              const HomeAppBar(),

              SizedBox(height: 20.h),

              const HomeSearchBar(),

              SizedBox(height: 20.h),

              const HomeBanner(),

              SizedBox(height: 24.h),

              const CategoryList(),

              SizedBox(height: 24.h),

              const ProductGrid(),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
