import 'package:cartify_app/features/favorites/cubit/favourite_cubit.dart';
import 'package:cartify_app/features/favorites/cubit/favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_text_styles.dart';
import '../widgets/favorite_item_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text("My Favorites", style: AppTextStyles.heading2),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          final list = context.read<FavoritesCubit>().favorites;

          if (list.isEmpty) {
            return Center(
              child: Text("No favorites yet!", style: AppTextStyles.body),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(20.w),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return FavoriteItemCard(
                product: list[index],
                onRemove: () =>
                    context.read<FavoritesCubit>().toggleFavorite(list[index]),
              );
            },
          );
        },
      ),
    );
  }
}
