import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../home/models/product_model.dart';

class CartItemCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.product,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              product.image,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 4.h),
                Text(
                  "\$${product.price}",
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
