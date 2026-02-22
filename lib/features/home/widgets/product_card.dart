import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String title;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18.r)),
                child: Image.network(
                  widget.image,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 8.h,
                right: 8.w,
                child: _iconButton(
                  icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : AppColors.primary,
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ),

              Positioned(
                top: 8.h,
                left: 8.w,
                child: _iconButton(
                  icon: Icons.shopping_cart_outlined,
                  color: AppColors.primary,
                  onTap: () {},
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  widget.price,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Icon(icon, size: 18.sp, color: color),
      ),
    );
  }
}
