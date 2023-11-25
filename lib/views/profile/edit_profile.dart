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


bool isWeb() {
  // Use kIsWeb if available, or check the platform if kIsWeb is not available
  return kIsWeb || Platform.isAndroid || Platform.isIOS || Platform.isFuchsia;
}
class editProfile extends StatelessWidget {

  final dynamic data;
  const editProfile({Key? key,this.data}):super(key:key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<profileController>();
    // controller.nameController.text = data['name'];
    // controller.passController.text = data['password'];

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          ()=> Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profile_path.isEmpty 
              ? Image.asset(dp,width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make() 
              : Image.file(
                File(controller.profile_path.value),
                width: 100,
                fit: BoxFit.cover,
              
          
              ).box.roundedFull.clip(Clip.antiAlias).make(),
              

              // controller.profile_path.isEmpty
              // ? Image.asset(dp, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
              // : kIsWeb
              //     ? Image.network(
              //         controller.profile_path.value,
              //         width: 100,
              //         fit: BoxFit.cover,
              //       ).box.roundedFull.clip(Clip.antiAlias).make()
              //     : Image.file(
              //         File(controller.profile_path.value),
              //         width: 100,
              //         fit: BoxFit.cover,
              //       ).box.roundedFull.clip(Clip.antiAlias).make(),
                    
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
                10.heightBox,
                customTextField(controller: controller.oldpassController,hint: passwordExample,title: oldpass,isPwd: true),
                10.heightBox, 
                customTextField(controller: controller.newpassController,hint: passwordExample,title: newpass,isPwd: true),
                20.heightBox,
                controller.isLoading.value
                  ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(blackColor),
                  )
                  : SizedBox(
                  width: context.screenWidth -60,
                  child: button(
                  color: blackColor,
                  onPress: ()async{
                    controller.isLoading(true);

                    //if image is not changed
                    if(controller.profile_path.value.isNotEmpty){
                      await controller.uploadDP();
                    } else{
                      controller.profileImageLink = data['imageUrl'];
                    }

                    if( data['password'] == controller.oldpassController.text){

                      await controller.changePasswordInAuth(
                        email: data['email'],
                        pwd: controller.oldpassController.text,
                        newPwd: controller.newpassController.text
                      );

                        await controller.updateProfile(
                        imgUrl: controller.profileImageLink,
                        name: controller.nameController.text,
                        password: controller.newpassController.text
                      );
                      VxToast.show(context, msg: "User data updated!");
                    }
                    else{
                      VxToast.show(context, msg: "Incorrect old password");
                      controller.isLoading(false);
                    }

                    
                    
                    
                  },
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