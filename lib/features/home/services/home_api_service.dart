import 'package:dio/dio.dart';
import '../models/product_model.dart';

class HomeApiService {
  final Dio dio;

  HomeApiService(this.dio);

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get("https://fakestoreapi.com/products");

    final List data = response.data;

    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}
