import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_products_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 65, left: 8, right: 8),
      child: FutureBuilder<List<ProductModel>>(
        future: AllProductsService().getProduct(),
        builder: (context, snapshot) {
          print('snapshot======== ${snapshot.data}');
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Error , try later...'));
          } else if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
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
        },
      ),
    );
  }
}
