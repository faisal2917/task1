import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants/app_urls.dart';
import 'package:task/services/http_service.dart';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class DataController extends GetxController {
  TextEditingController apartmentCtrl = TextEditingController();

  String? dropdownvalueBuilding;
  var chooseBuilding = ['1', '2', '3', '4'];

  String? dropdownvalueBedroom;
  var chooseBedroom = ['1', '2', '3', '4'];

  final dio = Dio();

  var httpService = HttpService();
  Future<void> addBuilding() async {
    try {
      final result = await httpService
          .request(url: AppUrls.baseUrl, method: Method.post, body: {
        'title': "New Apartment",
        'room_id': dropdownvalueBedroom,
        'type': "2",
        'building_id': dropdownvalueBuilding,
        'cluster_id': apartmentCtrl.text,
      });

      if (result != null) {
        print('result');
        Get.back();
        Get.snackbar("Success", "Add Building successfuly");
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', '$e');
    } finally {
      print('final');
      update();
    }
  }

  bool isLoading = false;
  Future<void> dummyFunc() async {
    isLoading = true;
    update();
    await Future.delayed(Duration(seconds: 3));
    isLoading = false;
    update();
    Get.snackbar("Success", "Add Building successfuly");
  }

  List<PostModel> postList = [];

  Future<void> getData() async {
    isLoading = true;
    update();
    try {
      var url = Uri.parse(AppUrls.dummypropertyCreate);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List result = jsonDecode(response.body);
        print(response.body);

        postList = result.map((e) => PostModel.fromJson(e)).toList();

        // return result;
      }
    } catch (e) {
      print(e);
      // Get.snackbar(e.toString(), 'hello');
    } finally {
      print('final');
      isLoading = false;
      update();
    }
  }
}
