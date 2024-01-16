import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/models/post_model.dart';

import '../controllers/data_screen_controller.dart';

class PostsScreen extends GetView<DataController> {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var dataController = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(title: Text('Posts Screen')),
      body: Column(
        children: [
          GetBuilder<DataController>(builder: (controller) {
            return Expanded(
              child: controller.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.postList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                              child:
                                  Text('${controller.postList[index].userId}')),
                          title: Text('${controller.postList[index].title}'),
                          subtitle: Text('${controller.postList[index].body}'),
                          trailing: Text('${controller.postList[index].id}'),
                        );
                      }),
            );
          })
        ],
      ),
    );
  }
}
