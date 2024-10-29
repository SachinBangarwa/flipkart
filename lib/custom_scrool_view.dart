

import 'package:flutter/material.dart';

class RecapeScreen extends StatelessWidget {
  const RecapeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: SafeArea(
       child: CustomScrollView(
         slivers: [
           SliverAppBar(
             shape: ShapeBorder.lerp(InputBorder.none, LinearBorder.none, 10),
            // floating: false,klk
             expandedHeight: 300,backgroundColor: Colors.blue.withOpacity(0.2),
             flexibleSpace: FlexibleSpaceBar(
               background: Image.network("https://images.unsplash.com/photo-1464226184884-fa280b87c399?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
           )
             ),

           ),
           SliverToBoxAdapter(
             child: getBody(),
           )
         ],
       ),
     ),
    );
  }
  Widget getBody() {
    return Wrap(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '200', style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                  ),
                  Text(
                    '150',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ), Text(
                    '10',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '4.4',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Row(
                  children: [
                    Text('ingredients', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black),)
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),

          ],
        ),
      ],
    );
  }
}