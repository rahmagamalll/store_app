import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/update_page.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});

  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadowColor: Colors.grey,
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.substring(0, 6),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 130, 129, 129),
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' '${product.price.toString()}',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 130, 129, 129),
                            fontSize: 18),
                      ),
                      const Icon(Icons.favorite, color: Colors.red)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 12,
            top: -40,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
