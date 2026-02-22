import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/themes/app_theme.dart';
import 'core/themes/theme_cubit.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/favorites/logic/favorites_cubit.dart';
import 'features/cart/logic/cart_cubit.dart';
import 'features/splach/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CartifyApp());
}

class CartifyApp extends StatelessWidget {
  const CartifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => HomeCubit()..fetchProducts()),
        BlocProvider(create: (_) => FavoritesCubit()),
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
