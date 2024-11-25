import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_filed.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});
  static String id = 'UpdatePage';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? productName, desc, image;

  double? price;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'U',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 113, 191, 255)),
            ),
            Text(
              'pdate',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              ' P',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 113, 191, 255)),
            ),
            Text(
              'roduct',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: const CircularProgressIndicator(
          color: Colors.blueAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextFormFild(
                    onChanged: (data) {
                      productName = data;
                    },
                    hintText: 'Product Name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFild(
                    onChanged: (data) {
                      price = double.tryParse(data);
                    },
                    hintText: 'Price',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFild(
                    onChanged: (data) {
                      desc = data;
                    },
                    hintText: 'Description',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFild(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: 'Image',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                      onPressed: () async {
                        isLoading = true;
                        setState(() {});
                        try {
                          await UpdateProduct(product);
                          ShowSnackBar(
                              context, 'Product updated successfully.');
                          formKey.currentState!.reset();
                        } catch (e) {
                          throw Exception('error : ${e.toString()}');
                        }
                        isLoading = false;
                        setState(() {});
                      },
                      buttonName: 'Update Product'),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price : price,
        description: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
