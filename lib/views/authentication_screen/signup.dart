import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/home/home.dart';
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
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var pwdRetypeController = TextEditingController();

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
                customTextField(hint: nameHint,title: name,controller: nameController,isPwd: false),
                customTextField(hint: emailExample,title: email,controller: emailController,isPwd: false),
                customTextField(hint: passwordExample, title: password,controller: passwordController,isPwd: true),
                customTextField(hint: passwordExample, title: retypePassword,controller: pwdRetypeController,isPwd: true),
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
                  button(color: isChecked== true? blackColor :lightGrey,title: signup,textColor: whiteColor,
                  onPress: () async{
                    if(isChecked != false){
                      try{
                        await controller.signupMethod(context: context,email: emailController.text,password: passwordController.text).then((value) {
                          return controller.storeUserData(
                            name: nameController.text,
                            password: passwordController.text,
                            email: emailController.text
                          );
                        }).then((value){
                          VxToast.show(context, msg: successLogin);
                          Get.offAll(()=>Home());
                        });

                      }
                      //if there is an error while logging in e.g, slow internet
                      catch(e){
                        //for safety purposes...signout
                        auth.signOut();
                        VxToast.show(context, msg: e.toString());
                      }
                    }

                  }).box.width(context.screenWidth-50).make(),
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