




import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/remote/network/NetworkApiService.dart';
import '../view_models/categoriy_model.dart';

class ProviderCategoriy extends ChangeNotifier {
  NetworkApiService networkApiService = NetworkApiService();
  List<Category> temp = [];
  String previousData = "";

  Future<List<Category>> getCategoriy() async {
    var data = await networkApiService.getResponse('categories');
    if (data.toString() == previousData) {
      // Data has not changed, don't print anything
      return temp;
    }

    previousData = data.toString(); // Update previous data

    print(data);

    temp.clear(); // Clear the previous data
    if (data.toString().contains("categories")) {
      for (var item in data["categories"]) {
        temp.add(
            Category(
              id:  item['id'] ,
              name:  item['name'] ,
              createdAt:item['created_at'],
              updatedAt:  item['updated_at'] ,
              sendersCount: item['senders_count'],
              senders: item['senders']
            )
        );
      }
    }

    notifyListeners();
    return temp;
  }

  late int clickedItem=0;
  void toggleIndex(index){
    clickedItem=index;
    notifyListeners();
  }
  Future<Category> getSingleCategory() async {
    var data = await networkApiService.getResponse(
        'categories/$clickedItem');
    late  Category selectedStatus;
    print(data);
    if (data.toString().contains("categories")) {
      var item = data;
      selectedStatus =  Category(id: item['id'],
        name: item['name'],
        createdAt: item['created_at'],
        updatedAt: item['updated_at'],
        sendersCount: item['senders_count'],
        senders:item['senders'],

      );
    }
    return selectedStatus;
  }

  void postSingleCategory( Category  category) async {
    var tagJson = json.encode(category.toJson());
    var data = await networkApiService.postResponse('category',
        json.decode(tagJson)
    );
    notifyListeners();
  }

}