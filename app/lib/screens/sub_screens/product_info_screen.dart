import 'package:flutter/material.dart';

class ProductInfoScreen extends StatelessWidget {
  const ProductInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prodId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Center(
        child: Text('Ecrã de produto $prodId'),
      ),
    );
  }
}
