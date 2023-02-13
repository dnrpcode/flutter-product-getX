import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class ItemView extends GetView<HomeController> {
  ItemView(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(Routes.EDIT, arguments: data.id!),
      leading: CircleAvatar(),
      title: Text(data.name!),
      subtitle: Text(data.createdAt!),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => controller.delete(data.id!),
      ),
    );
  }
}
