import 'package:ecommerce_app/consts/consts.dart';

Widget button(){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: blackColor,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: (){}, 
    child: login.text.white.fontFamily(bold).make());
}