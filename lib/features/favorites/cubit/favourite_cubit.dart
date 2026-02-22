import 'package:cartify_app/features/favorites/cubit/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/models/product_model.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  final List<ProductModel> _favoritesList = [];

  List<ProductModel> get favorites => _favoritesList;

  void toggleFavorite(ProductModel product) {
    if (_favoritesList.any((element) => element.id == product.id)) {
      _favoritesList.removeWhere((element) => element.id == product.id);
    } else {
      _favoritesList.add(product);
    }
    emit(FavoritesUpdated(List.from(_favoritesList)));
  }

  bool isFavorite(int productId) {
    return _favoritesList.any((element) => element.id == productId);
  }
}
