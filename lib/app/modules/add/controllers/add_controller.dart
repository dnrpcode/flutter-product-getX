import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  late TextEditingController name;
  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
  }

  @override
  void onClose() {
    name.dispose();
  }
}
