import 'package:dio/dio.dart';
import '../models/product_model.dart';

class HomeApiService {
  final Dio dio;

  HomeApiService(this.dio);

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get(
      "https://api.escuelajs.co/api/v1/products/?categoryId=1",
    );

    final List data = response.data;

    final filteredProducts = data.where((json) {
      if (json['images'] == null) return false;
      if (json['images'] is! List) return false;
      if ((json['images'] as List).isEmpty) return false;

      final firstImage = json['images'][0];

      if (firstImage == null) return false;
      if (!firstImage.toString().startsWith('http')) return false;

      return true;
    }).toList();

    return filteredProducts.map((json) {
      return ProductModel(
        id: json['id'],
        title: json['title'],
        price: (json['price'] as num).toDouble(),
        image: json['images'][0],
        description: json['description'],
        category: json['category']['name'],
      );
    }).toList();
  }
}
