import 'package:flipkart/screen/card_screen.dart';
import 'package:flipkart/screen/home_screen.dart';
import 'package:flipkart/screen/product_screen.dart';
import 'package:flipkart/screen/profilescreen.dart';
import 'package:flutter/material.dart';

class DeshbordScreen extends StatefulWidget {
  const DeshbordScreen({super.key});

  @override
  State<DeshbordScreen> createState() => _DeshbordScreenState();
}

class _DeshbordScreenState extends State<DeshbordScreen> {
  List<Widget> widgetlist=[
    HomeScreen(),
    ProdectScreen(),
    CardScreen(),
    ProfileScreen()
  ];
  int _courntvalue=0;
  void _onTapTaped(index){
    setState(() {
      _courntvalue=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _courntvalue,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
       selectedItemColor: Colors.red,

        unselectedItemColor: Colors.grey[800],
        backgroundColor: Colors.grey[200],
        items: [
          BottomNavigationBarItem(icon:Icon( Icons.home_filled),label: "home"),
          BottomNavigationBarItem(icon:Icon( Icons.production_quantity_limits),label: "prodect"),
          BottomNavigationBarItem(icon:Icon( Icons.card_giftcard),label: "card"),
          BottomNavigationBarItem(icon:Icon( Icons.person),label: "profile"),
        ],
         onTap: _onTapTaped,
      ),
      body: widgetlist[_courntvalue],
    );
  }
}
