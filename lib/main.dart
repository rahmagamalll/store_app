import 'package:flutter/material.dart';
import 'package:store_app/pages/add_product_page.dart';
import 'package:store_app/pages/categories_page.dart';
import 'package:store_app/pages/category_type_page.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/update_page.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      routes: {
        UpdatePage.id :(context)=>UpdatePage(),
        HomePage.id :(context)=>HomePage(),
        CategoriesPage.id :(context)=>CategoriesPage(),
        CategoryTypePage.id :(context)=>CategoryTypePage(),
        AddProductPage.id :(context)=>AddProductPage(),
      },
     initialRoute:HomePage.id ,
    );
  }
}
