import 'package:flipkart/model/user_model.dart';
import 'package:flipkart/screen/login_screen.dart';
import 'package:flipkart/screen/signup_screen.dart';
import 'package:flutter/material.dart';

class SpleseScreen extends StatefulWidget {
  const SpleseScreen({super.key});

  @override
  State<SpleseScreen> createState() => _SpleseScreenState();
}

class _SpleseScreenState extends State<SpleseScreen> {
  @override
  void initState() {
    splace();
    super.initState();
  }
  Future splace()async{
    if(UserModel.isbool) {
      LoginScreen();
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("hello"),
    );
  }
}
