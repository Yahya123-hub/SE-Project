import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/consts/images.dart';
import 'package:ecommerce_app/controllers/profileController.dart';
import 'package:ecommerce_app/widgets/background.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/customTextfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class editProfile extends StatelessWidget {

  final dynamic data;
  const editProfile({Key? key,this.data}):super(key:key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<profileController>();
    controller.nameController.text = data['name'];
    controller.passController.text = data['password'];

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          ()=> Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // controller.profile_path.isEmpty 
              // ? Image.asset(dp,width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make() 
              // : Image.file(
              //   File(controller.profile_path.value),
              //   width: 100,
              //   fit: BoxFit.cover,
          
              // ).box.roundedFull.clip(Clip.antiAlias).make(),
              controller.profile_path.isEmpty
              ? Image.asset(dp, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
              : kIsWeb
                  ? Image.network(
                      controller.profile_path.value,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                      File(controller.profile_path.value),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              button(
                color: blackColor,
                onPress: (){
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: "Change"),
                const Divider(),
                20.heightBox,
                customTextField(controller: controller.nameController,hint: nameHint,title: name,isPwd: false),
                customTextField(controller: controller.passController,hint: passwordExample,title: password,isPwd: true),
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
        ),
      )
    );
  }
}