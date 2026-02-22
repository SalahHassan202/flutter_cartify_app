import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_banner.dart';
import '../widgets/category_list.dart';
import '../widgets/product_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..fetchProducts(),
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is HomeError) {
                return Center(child: Text(state.message));
              }

              if (state is HomeSuccess) {
                return SingleChildScrollView(
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

                      ProductGrid(products: state.products),

                      SizedBox(height: 40.h),
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
