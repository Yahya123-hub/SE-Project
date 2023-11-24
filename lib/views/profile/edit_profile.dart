import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/consts/images.dart';
import 'package:ecommerce_app/widgets/background.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/customTextfield.dart';
import 'package:flutter/material.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(dp,width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            button(
              color: blackColor,
              onPress: (){
                
              },
              textColor: whiteColor,
              title: "Change"),
              const Divider(),
              20.heightBox,
              customTextField(hint: nameHint,title: name,isPwd: false),
              customTextField(hint: passwordExample,title: password,isPwd: true),
              20.heightBox,
              SizedBox(
                width: context.screenWidth -60,
                child: button(
                color: blackColor,
                onPress: (){},
                textColor: whiteColor,
                title: "Save Changes"),
              ),
            
          ],
        ).box.white.shadowSm.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top:50,left: 12,right: 12)).rounded.make(),
      )
    );
  }
}