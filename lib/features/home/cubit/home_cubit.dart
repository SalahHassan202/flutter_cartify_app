import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/home_api_service.dart';
import '../models/product_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final HomeApiService api = HomeApiService(Dio());
  List<ProductModel> allProducts = [];

  Future<void> fetchProducts() async {
    emit(HomeLoading());
    try {
      allProducts = await api.getProducts();
      emit(HomeSuccess(allProducts));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(HomeSuccess(allProducts));
    } else {
      final filtered = allProducts
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(HomeSuccess(filtered));
    }
  }

  void filterByCategory(String categoryName) {
    if (categoryName == "Men" || categoryName == "All") {
      emit(HomeSuccess(allProducts));
    } else {
      final filtered = allProducts
          .where((p) => p.category.toLowerCase() == categoryName.toLowerCase())
          .toList();
      emit(HomeSuccess(filtered));
    }
  }
}
