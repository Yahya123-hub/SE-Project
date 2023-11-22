import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/views/authentication_screen/login.dart';
import 'package:ecommerce_app/views/home/home.dart';
import 'package:ecommerce_app/widgets/appLogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/consts/colors.dart';
import 'package:get/get.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}
String name = 'Ebuy';
class _Splash_screenState extends State<Splash_screen> {
  


changeScreen() {
  Future.delayed (const Duration(seconds: 3), () {
//using getX
//Get.to(() => const login_screen()); 


auth.authStateChanges().listen((User? user) {
   if (user== null && mounted) { Get.to(() => const login_screen()); } 
   else {
    Get.to(() => const Home());}
});

});

}
@override
void initState(){
  changeScreen();
  super.initState();
}


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: blackColor, 
       body: Center( 
        child: Column( 
          children: [
            Align(alignment: Alignment.topLeft,child:Image.asset(icSplashBg,width: 300)),
            //20.heightBox,
            applogoWidget(),
            //1.heightBox,
            name.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            //appversion.text.white.make(),
            
          ]        
      ), // Column
      ), // Center 
    );
  }
}