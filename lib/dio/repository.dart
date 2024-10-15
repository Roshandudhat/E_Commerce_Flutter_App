import 'package:dio/dio.dart';
import 'package:e_commerce/dio/dataModel/product.dart';
import '../dio/dioclient.dart';
import '../utils/debug.dart';

class Repository {
  DioClient? dioClient;

  Repository([this.dioClient]);

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await dioClient!.dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        Debug.printLog("Login Success: ${response.data}");
      } else {
        Debug.printLog("Login Failed: ${response.statusCode}");
      }
      return response.data;  // Return the response data
    } catch (e) {
      Debug.printLog("Error during login: $e");
      throw e;  // Rethrow the error for handling
    }
  }

  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> data) async {
    try {
      Response response = await dioClient!.dio.post('/users', data: data);
      if (response.statusCode == 200) {
        return response.data;
        // return jsonResponse.map((repo) => User.fromJson(repo)).toList();
      } else{
        throw [];
      }

    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
  Future<List<dynamic>> getProductCategories() async {
    try {
      try {
        final response = await dioClient!.dio.get('/products/categories');
        return response.data;
      } catch (e) {
        Debug.printLog('Error fetching categories: $e');
        return [];
      }

    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<List<Product>> getProduct() async {
    try {
      try {
        final response = await dioClient!.dio.get('/products', queryParameters: {'limit': 10});
        return (response.data as List).map((json) => Product.fromJson(json)).toList();
      } catch (e) {
        Debug.printLog('Error fetching categories: $e');
        return [];
      }

    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
  Future<List<Product>> getProductAll() async {
    try {
      try {
        final response = await dioClient!.dio.get('/products');
        return (response.data as List).map((json) => Product.fromJson(json)).toList();
      } catch (e) {
        Debug.printLog('Error fetching categories: $e');
        return [];
      }

    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }



}
