import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getProduct() async {
    List<dynamic> data =
        await Api().get(url:'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];

    for (var i = 0; i < data.length; i++) {
         print('funnnnnnnnnn==========$data');
      productList.add(ProductModel.fromJson(data[i]),);
    }

    print('list==========$productList');
    
    return productList;
  }
}
