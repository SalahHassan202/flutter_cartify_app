import 'package:cartify_app/features/favorites/screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../cart/screens/cart_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../cubit/layout_cubit.dart';
import '../cubit/layout_state.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeScreen(),
      const FavoritesScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return BlocProvider(
      create: (_) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          final cubit = context.read<LayoutCubit>();

          return Scaffold(
            extendBody: true,
            body: pages[cubit.currentIndex],
            bottomNavigationBar: Container(
              height: 70.h,
              margin: EdgeInsets.all(20.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    context,
                    0,
                    Icons.home_rounded,
                    "Home",
                    cubit.currentIndex,
                  ),
                  _buildNavItem(
                    context,
                    1,
                    Icons.favorite_rounded,
                    "Favorites",
                    cubit.currentIndex,
                  ),
                  _buildNavItem(
                    context,
                    2,
                    Icons.shopping_cart_rounded,
                    "Cart",
                    cubit.currentIndex,
                  ),
                  _buildNavItem(
                    context,
                    3,
                    Icons.person_rounded,
                    "Profile",
                    cubit.currentIndex,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    IconData icon,
    String label,
    int currentIndex,
  ) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => context.read<LayoutCubit>().changeTab(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : Colors.grey,
              size: 26.sp,
            ),
            if (isSelected) SizedBox(width: 8.w),
            if (isSelected)
              Text(
                label,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
