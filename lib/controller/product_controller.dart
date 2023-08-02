import 'package:aumettask_1/controller/get_data/data_controller.dart';
import 'package:aumettask_1/module/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final productProvider = ChangeNotifierProvider<ProductProvider>((ref) => ProductProvider());
class ProductProvider extends ChangeNotifier {
  Api _api=Api();
  List<Products> products=[];

  Future getProducts() async{
    var data =await _api.getDataPagination();
    List productData=data['products'];


    for(var elemnt in productData)
      products.add(Products.fromJson(elemnt));


    notifyListeners();
    return products;
  }
}