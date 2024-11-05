class ProductModel {
  int id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  // RatingModel ratingModel;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    // required this.ratingModel,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      // ratingModel: RatingModel.fromJson(
      //   jsonData['rating'],
      // ),
    );
  }
}

class RatingModel {
  dynamic rate;
  int count;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(count: jsonData['count']??5, rate: jsonData['rate']);
  }
}
