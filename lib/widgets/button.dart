import 'package:ecommerce_app/consts/consts.dart';

Widget button(/*required Color color,*/ {onPress,color,textColor,String? title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress, 
    child: title!.text.color(textColor).fontFamily(bold).make());
}