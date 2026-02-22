import '../../home/models/product_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<ProductModel> cartItems;
  final double totalPrice;
  CartUpdated(this.cartItems, this.totalPrice);
}
