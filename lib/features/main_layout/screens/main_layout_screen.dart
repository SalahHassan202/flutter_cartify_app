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
    return BlocProvider(
      create: (_) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          final cubit = context.read<LayoutCubit>();

          final pages = [
            const HomeScreen(),
            const FavoritesScreen(),
            const CartScreen(),
            const ProfileScreen(),
          ];

          return Scaffold(
            body: pages[cubit.currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                child: BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  onTap: cubit.changeTab,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.primary,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border),
                      activeIcon: Icon(Icons.favorite),
                      label: "Favorites",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_outlined),
                      activeIcon: Icon(Icons.shopping_cart),
                      label: "Cart",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      activeIcon: Icon(Icons.person),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
