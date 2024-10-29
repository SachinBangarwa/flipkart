
import 'package:flipkart/provider/store_provider.dart';
import 'package:flipkart/screen/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdectScreen extends StatefulWidget {
  const ProdectScreen({super.key});

  @override
  State<ProdectScreen> createState() => _ProdectScreenState();
}

class _ProdectScreenState extends State<ProdectScreen> {

  @override
  void initState() {
    final storeProvider=Provider.of<StoreProvider>(context,listen: false);
    storeProvider.getProductlist();

    super.initState();
  }


  void _onPressedButton() async {
    final storeProvider=Provider.of<StoreProvider>(context,listen: false);

    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddProductScreen()));
    storeProvider.getProductlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressedButton,
        backgroundColor: Colors.yellow[300],
        shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Consumer<StoreProvider>(
        builder: (context,provider,child){
          return  ListView.builder(
            itemCount:provider.products.length,
            itemBuilder: (context, index) {
              final product =provider.products[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    product.imageUrl ?? "https://prashanthfertility.com/wp-content/uploads/2024/08/IUI-Babies-Vs.-Normal-Babies.webp",
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(product.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.description),
                      Text(
                        '\$${product.price.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.shopping_cart),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
