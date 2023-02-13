import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  final HomeC = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final data = HomeC.findById(Get.arguments);
    controller.name.text = data.name!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              autocorrect: false,
              controller: controller.name,
              decoration: InputDecoration(
                labelText: "Product Name",
                hintText: "Input Product Name",
                border: OutlineInputBorder(),
              ),
              onEditingComplete: () =>
                  HomeC.edit(Get.arguments, controller.name.text),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () =>
                    HomeC.edit(Get.arguments, controller.name.text),
                child: Text("Edit Product"))
          ],
        ),
      ),
    );
  }
}
