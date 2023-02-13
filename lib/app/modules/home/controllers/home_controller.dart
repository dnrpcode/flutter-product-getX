import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  void add(String name) {
    if (name != '') {
      final date = DateTime.now().toIso8601String();
      final data = Product(id: date, name: name, createdAt: date);
      products.add(data);
      Get.back();
    } else {
      dialogError("Mohon masukan nama!");
    }
  }

  void delete(String id) {
    products.removeWhere((e) => e.id == id);
  }

  Product findById(String id) {
    return products.firstWhere((element) => element.id == id);
  }

  void edit(String id, String name) {
    final data = findById(id);
    data.name = name;
    products.refresh();
    Get.back();
  }
}
