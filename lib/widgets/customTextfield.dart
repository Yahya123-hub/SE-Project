import 'package:ecommerce_app/consts/consts.dart';

Widget customTextField({String? title,String? hint, controller,isPwd}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(blackColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPwd,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(
          fontFamily: semibold, color: textfieldGrey,), // TextStyle
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide (color: blackColor))
      ),
      ),
      5.heightBox,
    ], 
  );
}
 // Column