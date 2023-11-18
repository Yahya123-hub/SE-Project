import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/widgets/background.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Container(
        //color: Colors.white,
        child: "Cart is empty!".text.fontFamily(semibold).color(darkFontGrey).makeCentered(),
      ),
    );
  }
}