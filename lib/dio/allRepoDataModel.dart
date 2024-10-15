import 'package:e_commerce/dio/dataModel/product.dart';
import 'package:e_commerce/dio/repository.dart';
import 'package:flutter/material.dart';
import '../../../dio/dioclient.dart';


class AllRepoDataModel {


  Future<Map<String, dynamic>> loginCall(BuildContext context,String userName,String pass) {
    DioClient dioClient = DioClient(context);
    return Repository(dioClient).login(userName,pass);
  }

  Future<Map<String, dynamic>> registionCall(BuildContext context,Map<String, dynamic> data) {
    DioClient dioClient = DioClient(context);
  return Repository(dioClient).registerUser(data);
  }

  Future<List<dynamic>> getCategory(BuildContext context) {
    DioClient dioClient = DioClient(context);
  return Repository(dioClient).getProductCategories();
  }

  Future<List<Product>> getProductAll(BuildContext context) {
    DioClient dioClient = DioClient(context);
  return Repository(dioClient).getProduct();
  }

  Future<List<Product>> getAllProduct(BuildContext context) {
    DioClient dioClient = DioClient(context);
  return Repository(dioClient).getProductAll();
  }


}
