// import 'package:flipkart/core/storage_helper.dart';
// import 'package:flutter/material.dart';
// import 'signup_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   void _login() async {
//     var savedUser = await UserPreferences.getUser();
//     if (emailController.text == savedUser['email'] && passwordController.text == savedUser['password']) {
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Login Successful')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Invalid Email or Password')),
//       );
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter email';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter password';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _login();
//                   }
//                 },
//                 child: Text('Login'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SignupScreen()),
//                   );
//                 },
//                 child: Text('Create Account'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flipkart/core/storage_helper.dart';
import 'package:flipkart/model/user_model.dart';
import 'package:flipkart/screen/deshboard_screen.dart';
import 'package:flipkart/screen/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> globelkey = GlobalKey();

  void _login() async {
    UserModel? user = await StorageHelper.getdata();
    if(user!=null) {
      if (emailcontroller.text == user.email &&
          passwordcontroller.text == user.password) {
        UserModel.isbool=true;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login Successful")));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DeshbordScreen()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(
            SnackBar(content: Text("envailid email and password")));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: globelkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      labelText: "email", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "required email";
                    }return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      labelText: "password", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "required email";
                    }return null;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (globelkey.currentState!.validate() ) {
                        _login();
                      }
                    },
                    child: Text("Login")),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen(),));
                }, child:const Text("Create")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
