import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_category_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class CategoryTypePageBody extends StatelessWidget {
  const CategoryTypePageBody({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 65, left: 8, right: 8),
      child: FutureBuilder(
          future: GetCategoryService().getProducts(categoryName),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Error: ${snapshot.error}');
              return Center(child: Text('Error , try later...'));
            } else if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ));
            } else {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                itemCount: products.length,
                itemBuilder: (context, index) =>
                    CustomCard(product: products[index]),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 70,
                ),
              );
            }
          }),
    );
  }
}
