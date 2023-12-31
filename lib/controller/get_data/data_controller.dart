import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class Api {
  Future getDataPagination(int offset,int limit ) async {
    http.Response response = await http
        .get(Uri.parse("https://api.slingacademy.com/v1/sample-data/products?offset${offset}&limit=${limit}"));
    var data = json.decode(response.body);
    if (response.statusCode == 200)
      return data;
    else {
      print("Error");
    }
  }
  Future getProductDetailes(int id ) async {
    http.Response response = await http
        .get(Uri.parse("https://api.slingacademy.com/v1/sample-data/products/$id"));
    var data = json.decode(response.body);
    if (response.statusCode == 200)
      return data;
    else {
      print("Error");
    }
  }
}
