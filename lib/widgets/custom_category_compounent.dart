import 'package:flutter/material.dart';
import 'package:store_app/pages/category_type_page.dart';

// ignore: must_be_immutable
class CustomCategoryCompounent extends StatelessWidget {
  CustomCategoryCompounent({super.key, this.categoryName});
  String? categoryName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoryTypePage.id,
            arguments: categoryName);
      },
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 113, 191, 255),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                        color:
                            const Color.fromARGB(255, 105, 100, 100).withOpacity(0.5),
                        offset: const Offset(10, 10),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ]),
              child: Center(
                child: Text(
                  categoryName!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
