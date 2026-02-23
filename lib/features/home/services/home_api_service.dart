import 'package:dio/dio.dart';
import '../models/product_model.dart';

class HomeApiService {
  final Dio dio;

  HomeApiService(this.dio);

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(
        "https://dummyjson.com/products?limit=194",
      );
      final List data = response.data['products'];

      final clothingData = data.where((item) {
        final category = item['category'].toString().toLowerCase();
        return category.contains('clothing') ||
            category.contains('shirts') ||
            category.contains('tops') ||
            category.contains('womens-dresses') ||
            category.contains('mens-shirts') ||
            category.contains('mens-shoes') ||
            category.contains('womens-shoes');
      }).toList();

      return clothingData.map((json) {
        return ProductModel(
          id: json['id'],
          title: json['title'],
          price: (json['price'] as num).toDouble(),
          image: json['thumbnail'],
          description: json['description'],
          category: json['category'],
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
