import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/app/data/providers/product_provider.dart';
import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  var products = List<Product>.empty().obs;

  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Terjadi Kesalaha",
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }

  void add(String name) {
    if (name != '') {
      final date = DateTime.now().toIso8601String();
      ProductProvider().postProduct(name, date).then((response) {
        final data = Product(id: response['name'], name: name, createdAt: date);
        products.add(data);
        Get.back();
      });
    } else {
      dialogError("Mohon masukan nama!");
    }
  }

  void delete(String id) {
    ProductProvider()
        .deleteProduct(id)
        .then((_) => products.removeWhere((e) => e.id == id));
  }

  void getAllProduct() {
    ProductProvider().getProduct().then((res) {
      print('resnya nih$res');
      // products.value = res;
      // products.refresh();
    });
  }

  Product findById(String id) {
    return products.firstWhere((element) => element.id == id);
  }

  void edit(String id, String name) {
    final data = findById(id);
    ProductProvider().editProduct(id, name).then((_) {
      data.name = name;
      products.refresh();
      Get.back();
    });
  }
}
