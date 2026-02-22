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

    final filteredData = data.where((json) {
      if (json['images'] == null ||
          json['images'] is! List ||
          (json['images'] as List).isEmpty) {
        return false;
      }
      final String firstImage = json['images'][0].toString();
      if (firstImage.isEmpty || !firstImage.startsWith('http')) {
        return false;
      }
      return true;
    }).toList();

    return filteredData.map((json) {
      String cleanImage = json['images'][0].toString().replaceAll(
        RegExp(r'[\[\]"]'),
        '',
      );
      return ProductModel(
        id: json['id'],
        title: json['title'],
        price: (json['price'] as num).toDouble(),
        image: cleanImage,
        description: json['description'],
        category: json['category']['name'],
      );
    }).toList();
  }
}
