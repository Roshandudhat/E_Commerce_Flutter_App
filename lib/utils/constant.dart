import 'dart:convert';
import 'package:e_commerce/dio/dataModel/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constant {

  static const baseUrl = "https://fakestoreapi.com";
  static const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static List<Product> productList = [];

  ///Keys
  static const String productListKey = 'product_list_key';
  static const String favoritesKey = 'favorites';


  // Fetch product list from SharedPreferences
  static Future<List<Product>> getProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productListJson = prefs.getString(productListKey);
    if (productListJson != null) {
      List<dynamic> jsonData = json.decode(productListJson);
      return jsonData.map((jsonItem) => Product.fromJson(jsonItem)).toList();
    }
    return [];
  }

  // Save product list to SharedPreferences
  static Future<void> saveProducts(List<Product> products) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String productListJson = json.encode(products.map((p) => p.toJson()).toList());
    await prefs.setString(productListKey, productListJson);
  }

  static  Future<void> addProduct(Product product) async {
    List<Product> products = await getProducts();
    products.add(product);
    await saveProducts(products);
  }

  // Update a product in the list
  static Future<void> updateProduct(Product updatedProduct) async {
    List<Product> products = await getProducts();
    int index = products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      products[index] = updatedProduct;
      await saveProducts(products);
    }
  }

  // Delete a product from the list
  static Future<void> deleteProduct(int productId) async {
    List<Product> products = await getProducts();
    products.removeWhere((p) => p.id == productId);
    await saveProducts(products);
  }


/// *///////////////////////////////////////////////////////////////////
  // Fetch product list from SharedPreferences
  static Future<List<Product>> getFavorite() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productListJson = prefs.getString(favoritesKey);
    if (productListJson != null) {
      List<dynamic> jsonData = json.decode(productListJson);
      return jsonData.map((jsonItem) => Product.fromJson(jsonItem)).toList();
    }
    return [];
  }

  // Save product list to SharedPreferences
  static Future<void> saveFavorite(List<Product> products) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String productListJson = json.encode(products.map((p) => p.toJson()).toList());
    await prefs.setString(favoritesKey, productListJson);
  }

  static  Future<void> addFavorite(Product product) async {
    List<Product> products = await getFavorite();
    products.add(product);
    await saveFavorite(products);
  }

  // Update a product in the list
  static Future<void> updateFavorite(Product updatedProduct) async {
    List<Product> products = await getFavorite();
    int index = products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      products[index] = updatedProduct;
      await saveFavorite(products);
    }
  }

  // Delete a product from the list
  static Future<void> deleteFavorite(int productId) async {
    List<Product> products = await getFavorite();
    products.removeWhere((p) => p.id == productId);
    await saveFavorite(products);
  }






}
