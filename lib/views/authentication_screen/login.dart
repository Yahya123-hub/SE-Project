import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/widgets/appLogo_widget.dart';
import 'package:ecommerce_app/widgets/background.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/customTextfield.dart';
import 'package:flutter/material.dart';

class login_screen extends StatelessWidget {
  const login_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
          child: Scaffold(
        body: Center(
          child: Column(children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            //10.heightBox,
            "LOG IN TO EBuy".text.fontFamily(bold).white.size(18).make(),
            10.heightBox,

            Column(
              children: [
                customTextField(hint: emailExample,title: email),
                customTextField(hint: passwordExample, title: password),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){},child: forgetPassword.text.make()),
                 

                ),
                 5.heightBox,
                 button().box.width(context.screenWidth-50).make(),
              ],
            ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-70).make()
          ]),
        ),
    ));
  }
}