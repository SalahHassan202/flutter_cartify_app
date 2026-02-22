import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/home_api_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final HomeApiService api = HomeApiService(Dio());

  Future<void> fetchProducts() async {
    emit(HomeLoading());

    try {
      final products = await api.getProducts();
      emit(HomeSuccess(products));
    } catch (e) {
      emit(HomeError("Failed to load products"));
    }
  }
}
