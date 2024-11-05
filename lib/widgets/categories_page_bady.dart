
import 'package:flutter/material.dart';
import 'package:store_app/services/all_categories_service.dart';
import 'package:store_app/widgets/custom_category_compounent.dart';

class CategoriesPageBody extends StatelessWidget {
  const CategoriesPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AllCategoriesService().getCategries(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return Center(child: Text('Error , try later...'));
        } else if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator( color: Colors.blueAccent,));
        } else {
          List<dynamic> categories = snapshot.data!;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) => CustomCategoryCompounent(
              categoryName: categories[index],
            ),
          );
        }
      },
    );
  }
}
