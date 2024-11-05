import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required String title,
      required dynamic price,
      required String description,
      required String image,
      required String category,
      required int id}) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price.toString(),
        'description': description,
        'image': image,
        'category': category,
      },
    );
    print('product id  = $id');
    print('updatedata========$data');
    return ProductModel.fromJson(data);
  }
}
