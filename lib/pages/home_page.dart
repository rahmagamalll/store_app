import 'package:flutter/material.dart';
import 'package:store_app/pages/add_product_page.dart';
import 'package:store_app/pages/categories_page.dart';
import 'package:store_app/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  @override
  static String id = 'HomePage';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CategoriesPage.id);
            },
            icon: const Icon(
              Icons.category_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProductPage.id);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          )
        ],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'S',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Color.fromARGB(255, 113, 191, 255)),
            ),
            Text(
              'tore',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const HomePageBody(),
    );
  }
}

