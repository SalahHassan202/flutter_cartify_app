import 'package:cartify_app/features/cart/cubit/cart_cubit.dart';
import 'package:cartify_app/features/cart/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_text_styles.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/cart_summary_section.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text("My Cart", style: AppTextStyles.heading2),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final items = context.read<CartCubit>().cartItems;
          final total = context.read<CartCubit>().totalPrice;

          if (items.isEmpty) {
            return Center(
              child: Text("Your cart is empty!", style: AppTextStyles.body),
            );
          }

          return Stack(
            children: [
              ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 220.h),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CartItemCard(product: items[index]);
                },
              ),
              if (total > 0)
                Positioned(
                  bottom: 100.h,
                  left: 0,
                  right: 0,
                  child: CartSummarySection(total: total),
                ),
            ],
          );
        },
      ),
    );
  }
}
