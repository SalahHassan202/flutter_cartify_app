import 'package:cartify_app/features/cart/cubit/cart_cubit.dart';
import 'package:cartify_app/features/favorites/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../home/models/product_model.dart';

class BottomActionBar extends StatelessWidget {
  final ProductModel product;

  const BottomActionBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.read<FavoritesCubit>().toggleFavorite(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Updated Favorites"),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: Container(
              height: 56.h,
              width: 56.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: BlocBuilder<FavoritesCubit, dynamic>(
                builder: (context, state) {
                  final isFav = context.read<FavoritesCubit>().isFavorite(
                    product.id,
                  );
                  return Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? Colors.red : AppColors.primary,
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, 56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              onPressed: () {
                context.read<CartCubit>().addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Added to Cart"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
