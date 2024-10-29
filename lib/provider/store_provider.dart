import 'package:flipkart/core/storage_helper.dart';
import 'package:flipkart/model/prodect_modal.dart';
import 'package:flutter/widgets.dart';

class StoreProvider extends ChangeNotifier{

  List<ProdectModal> products = [];
  StorageHelper storageHelper = StorageHelper();

  void getProductlist() async {
   this. products = await storageHelper.getProuct();

  // this. products=products;

   notifyListeners();
  }


}