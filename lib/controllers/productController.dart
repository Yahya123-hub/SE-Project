import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/models/categoryModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  var sub_category = [];

  get_subCategories(title)async{
    sub_category.clear();
    var data = await rootBundle.loadString("lib/services/categoryModel.json");
    var decoded = categoryModelFromJson(data);
    var s = decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory){
      sub_category.add(e);
    }
  }
}