import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Screen"),
      ),
      body: Center(
        child: Text(
          "Card Screen",
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
