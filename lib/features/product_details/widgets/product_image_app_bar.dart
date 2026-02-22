import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageAppBar extends StatelessWidget {
  final String imageUrl;
  const ProductImageAppBar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 450.h,
      pinned: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.white.withValues(alpha: 0.9),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
