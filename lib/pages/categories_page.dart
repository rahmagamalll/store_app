import 'package:flutter/material.dart';
import 'package:store_app/widgets/categories_page_bady.dart';
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});
  static String id = 'CategoriesPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'C',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color.fromARGB(255, 113, 191, 255)),
            ),
            Text(
              'ategories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: CategoriesPageBody()),
    );
  }
}
