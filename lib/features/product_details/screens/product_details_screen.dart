import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/models/product_model.dart';
import '../widgets/product_image_app_bar.dart';
import '../widgets/product_info_section.dart';
import '../widgets/size_selector.dart';
import '../widgets/bottom_action_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomActionBar(product: product),
      body: CustomScrollView(
        slivers: [
          ProductImageAppBar(imageUrl: product.image),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductInfoSection(
                    title: product.title,
                    category: product.category,
                    price: product.price,
                    description: product.description,
                  ),
                  SizedBox(height: 24.h),
                  const SizeSelector(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
