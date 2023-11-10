import 'package:flutter/material.dart';
import 'package:ecommerce_app/consts/consts.dart';
//import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/widgets/appLogo_widget.dart';
import 'package:ecommerce_app/widgets/background.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/customTextfield.dart';
import 'package:get/get.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({super.key});

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {

  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return bgWidget(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            //10.heightBox,
            "SIGN UP TO EBuy".text.fontFamily(bold).white.size(18).make(),
            10.heightBox,

            Column(
              children: [
                customTextField(hint: nameHint,title: name),
                customTextField(hint: emailExample,title: email),
                customTextField(hint: passwordExample, title: password),
                customTextField(hint: passwordExample, title: retypePassword),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){},child: forgetPassword.text.make()),
                 

                ),
                 Row(
                    children: [
                      Checkbox(checkColor: blackColor,value: isChecked, onChanged: (newValue){
                        setState(() {
                          isChecked = newValue;
                        });
                        
                      }),
                      10.widthBox,
                      Expanded(child: RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: "I agree to the ",style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey
                            )
                          ),
                          TextSpan(
                            text: termAndCond,style: TextStyle(
                              fontFamily: regular,
                              color: blackColor
                            )
                          ),
                          TextSpan(
                            text: " & ",style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey
                            )
                          ),
                          TextSpan(
                            text: privacyPolicy,style: TextStyle(
                              fontFamily: regular,
                              color: blackColor
                            )
                          )

                        ]
                      )))
                      
                    ],
                  ),
                  5.heightBox,
                 //button().box.width(context.screenWidth-50).make(),
                  button(color: isChecked== true? blackColor :lightGrey,title: signup,textColor: whiteColor,onPress: (){}).box.width(context.screenWidth-50).make(),
                  10.heightBox,
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: already,
                        style: TextStyle(
                          fontFamily: bold,
                          color: fontGrey,
                        )
                      ),
                      TextSpan(
                        text: login,
                        style: TextStyle(
                          fontFamily: bold,
                          color: blackColor,
                        )
                      )
                    ]
                  )).onTap(() {
                    Get.back();
                  })
                  
                  
              ],
            ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make()
          ]),
        ),
    ));
  }
}