import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/authentication_screen/signup.dart';
import 'package:ecommerce_app/views/home/home.dart';
import 'package:ecommerce_app/widgets/appLogo_widget.dart';
import 'package:ecommerce_app/widgets/background.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/customTextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class login_screen extends StatelessWidget {
  const login_screen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());

    return bgWidget(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(children: [
            (context.screenHeight * 0.05).heightBox,
            applogoWidget(),
            //10.heightBox,
            "LOG IN TO EBuy".text.fontFamily(bold).white.size(18).make(),
            10.heightBox,

            Column(
              children: [
                customTextField(hint: emailExample,title: email,isPwd: false,controller: controller.emailController),
                customTextField(hint: passwordExample, title: password,isPwd: true,controller: controller.passwordController),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){},child: forgetPassword.text.make()),
                 

                ),
                 5.heightBox,
                 //button().box.width(context.screenWidth-50).make(),
                  button(color: blackColor,
                  title: login,
                  textColor: whiteColor,
                  onPress: () async {
                    //Get.to(()=>Home());
                    await controller.loginMethod(context: context).then((value){
                      if (value != null){
                        VxToast.show(context, msg: successLogin);
                        Get.offAll(() => const Home());
                      }
                    });

                  }).box.width(context.screenWidth-50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  button(color: lightGrey,title: signup,textColor: blackColor,onPress: (){
                    Get.to(()=>signup_screen());
                  }).box.width(context.screenWidth-50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircleAvatar(
                      backgroundColor: lightGrey,
                      radius: 25,
                      child: Image.asset(
                        appsIconList[index],
                        width: 30,
                        ),
                    ),
                    ),
                    ),
                  )
              ],
            ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make()
          ]),
        ),
    ));
  }
}