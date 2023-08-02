import 'package:aumettask_1/controller/get_data/data_controller.dart';
import 'package:aumettask_1/module/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final productProvider = ChangeNotifierProvider<ProductProvider>((ref) => ProductProvider());
class ProductProvider extends ChangeNotifier {
  Api _api=Api();
  List<Products> products=[];
  List<Products> productDetailes=[];

  Future getProducts(int offset,int limit  ) async{
    var data =await _api.getDataPagination( offset, limit );
    List productData=data['products'];


    for(var elemnt in productData)
      products.add(Products.fromJson(elemnt));


    notifyListeners();
    return products;
  }
  Future<List<Products>> getProductDetailes(int id  ) async{
    var data =await _api.getProductDetailes(id);
    List productData=data['product'];


    for(var elemnt in productData)
      productDetailes.add(Products.fromJson(elemnt));

print(productDetailes);
    notifyListeners();
    return productDetailes;
  }

}