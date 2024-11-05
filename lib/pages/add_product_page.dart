import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_filed.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({super.key});
  static String id = 'AddProductPage';

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String? productName, desc, image, category;

  bool isLoading = false;

  double? price;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'A',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color.fromARGB(255, 113, 191, 255),
              ),
            ),
            Text(
              'dd',
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
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFild(
                    onChanged: (data) {
                      price = double.tryParse(data);
                    },
                    hintText: 'Price',
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFild(
                    onChanged: (data) {
                      desc = data;
                    },
                    hintText: 'Description',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFild(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: 'Image',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFild(
                    onChanged: (data) {
                      category = data;
                    },
                    hintText: 'Category',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                      onPressed: () async {
                        try {
                          isLoading = true;
                          setState(() {});
                          if (formKey.currentState!.validate()) {
                            await AddProduct();
                            ShowSnackBar(
                                context, 'Product added successfully.');
                            formKey.currentState!.reset();
                          }
                        } catch (e) {
                          throw Exception('error : ${e.toString()}');
                        }
                        isLoading = false;
                        setState(() {});
                      },
                      buttonName: 'Add Product'),
                  SizedBox(
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

  Future<void> AddProduct() async {
    await AddProductService().addProduct(
        title: productName!,
        price: price!,
        description: desc!,
        image: image!,
        category: category!);
  }
}
