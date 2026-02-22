import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';
import '../../home/models/product_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<ProductModel> _cartItems = [];

  List<ProductModel> get cartItems => _cartItems;

  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + item.price);

  void addToCart(ProductModel product) {
    _cartItems.add(product);
    emit(CartUpdated(List.from(_cartItems), totalPrice));
  }

  void removeFromCart(ProductModel product) {
    _cartItems.removeWhere((item) => item.id == product.id);
    emit(CartUpdated(List.from(_cartItems), totalPrice));
  }

  void clearCart() {
    _cartItems.clear();
    emit(CartUpdated(List.from(_cartItems), 0.0));
  }
}
