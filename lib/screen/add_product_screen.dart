import 'package:flipkart/core/storage_helper.dart';
import 'package:flipkart/model/prodect_modal.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  StorageHelper storageHelper=StorageHelper();
  void _saveProduct() {
    String id =Uuid().v4();
    String name = nameController.text;
    String description = descriptionController.text;
    String imageUrl = imageUrlController.text;
    double price = double.parse(priceController.text);

    if(name.isNotEmpty&&price>0) {
      ProdectModal prodectModal = ProdectModal(
          id: id,
          name: name,
          description: description,
          imageUrl: imageUrl,
          price: price
      );

      storageHelper.saveProduct(prodectModal); 

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Confrom save prodect")));
      Navigator.pop(context);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("please enter you price and name")));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(labelText: 'Product Description'),
              ),
              TextField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: 'Product Image URL'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Product Price'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProduct,
                child: Text('Save Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
