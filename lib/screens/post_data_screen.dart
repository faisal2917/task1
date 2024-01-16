import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/data_screen_controller.dart';

import 'posts_screen.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DataController());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<DataController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                      child: Text(
                    'Add the apartment information',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurple),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        isDense: true,
                        hintText: 'Select Building',
                        hintStyle: TextStyle(color: Colors.deepPurple),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    value: controller.dropdownvalueBuilding,
                    items: controller.chooseBuilding
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (v) {
                      controller.dropdownvalueBuilding = v;
                    }),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        isDense: true,
                        hintText: 'Number of bedrooms',
                        hintStyle: TextStyle(color: Colors.deepPurple),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    value: controller.dropdownvalueBedroom,
                    items: controller.chooseBedroom
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (v) {
                      controller.dropdownvalueBedroom = v;
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.apartmentCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: 'Enter the apartment number',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      // EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      // controller.getData();
                      Get.to(PostsScreen());
                      controller.getData();
                    },
                    child: controller.isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Next')),
              ],
            ),
          );
        }),
      ),
    );
  }
}
