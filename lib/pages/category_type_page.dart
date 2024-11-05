import 'package:flutter/material.dart';
import 'package:store_app/widgets/category_type_page_body.dart';

class CategoryTypePage extends StatelessWidget {
  CategoryTypePage({super.key});
  static String id = 'CategoryTypePage';
  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                categoryName.substring(0, 1),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromARGB(255, 113, 191, 255)),
              ),
              Text(
                categoryName.substring(1, categoryName.length),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: CategoryTypePageBody(categoryName: categoryName),);
  }
}

