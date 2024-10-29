// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserPreferences {
//   static Future<void> saveUser(String email, String password) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     await prefs.setString("email", email);
//     await prefs.setString("password", password);
//   }
//
//   static Future<Map<String, String>> getUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? email = prefs.getString('email');
//     String? password = prefs.getString('password');
//     return {
//       'email': email ?? '',
//       'password': password ?? '',
//     };
//   }
//   static Future<void> clearUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('email');
//     await prefs.remove('password');
//   }
// }
// class StorageHelper{
//   static Future<void> savedata(String email,String password)async{
//     SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
//
//     sharedPreferences.setString("email",email );
//     sharedPreferences.setString("password",password );
//   }
//
//   static Future<Map<String,dynamic>> getdata()async{
//     SharedPreferences shared=await SharedPreferences.getInstance();
//     String? email=shared.getString("email");
//     String? password=shared.getString("password");
//     return{
//       "email":email ??"",
//       "password":password ??"",
//     };
//
//   }
//
// }

import 'dart:convert';

import 'package:flipkart/model/prodect_modal.dart';
import 'package:flipkart/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper{
  static const String productKey = 'products';
 static Future<void> savedata(UserModel user) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("email", user.email);
    sharedPreferences.setString("password", user.password);
    sharedPreferences.setBool("isbool", UserModel.isbool);
  }
 static Future<UserModel?> getdata()async{
    SharedPreferences sh=await SharedPreferences.getInstance();
     String? email1= sh.getString("email");
    String? password1 =sh.getString("password");
    String? isbool =sh.getString("isbool");
    if(email1!=null&&password1!=null){
    return UserModel(email: email1, password: password1,);
  }return null;
 }
//return{
//       'email': email ?? '',
//       'password': password ?? '',
//     };
//  static Future<void> saveProduct(ProdectModal product) async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String? productListString = prefs.getString(productKey);
//    List<dynamic> productList = productListString != null
//        ? jsonDecode(productListString)
//        : [];
//
//    productList.add(product.toMap());
//    await prefs.setString(productKey, jsonEncode(productList));
//  }
//
//  // Retrieve product list from SharedPreferences
//  static Future<List<ProdectModal>> getProductList() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String? productListString = prefs.getString(productKey);
//    if (productListString != null) {
//      List<dynamic> productList = jsonDecode(productListString);
//      return productList.map((product) => ProdectModal.fromMap(product)).toList();
//    } else {
//      return [];
//    }
//  }
//
//  // Clear all products
//  static Future<void> clearProducts() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    await prefs.remove(productKey);
//  }

 Future <void> saveProduct(ProdectModal product)async{
   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   Map<String,dynamic> map=product.toMap();
   List<String> maplist=sharedPreferences.getStringList(productKey)??[];
   String mapvalue=jsonEncode(map);
   maplist.add(mapvalue);
   sharedPreferences.setStringList(productKey, maplist);
}

Future<List<ProdectModal>> getProuct()async{
   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
 List<String>? prefe =sharedPreferences.getStringList(productKey)??[];
 List<ProdectModal> productlist=[];
   for(int i=0;i<prefe.length;i++){
   String value=prefe[i];
   Map<String,dynamic> map=jsonDecode(value);
  ProdectModal prodectModal=ProdectModal.fromMap(map);
  productlist.add(prodectModal);
 }return productlist;

}
  static Future<void> clearProducts() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   // await prefs.remove(productKey);
 }

}
