import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';
import '../../home/models/product_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<ProductModel> _cartItems = [];

  List<ProductModel> get cartItems => _cartItems;
  double get totalPrice =>
      _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addToCart(ProductModel product) {
    int index = _cartItems.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      product.quantity = 1;
      _cartItems.add(product);
    }
    emit(CartUpdated(List.from(_cartItems), totalPrice));
  }

  void removeOneFromCart(ProductModel product) {
    int index = _cartItems.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      } else {
        _cartItems.removeAt(index);
      }
    }
    emit(CartUpdated(List.from(_cartItems), totalPrice));
  }

  void removeFromCart(ProductModel product) {
    _cartItems.removeWhere((item) => item.id == product.id);
    emit(CartUpdated(List.from(_cartItems), totalPrice));
  }
}
