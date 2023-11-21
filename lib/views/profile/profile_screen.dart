import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/authentication_screen/login.dart';
import 'package:ecommerce_app/views/profile/components/detailCard.dart';
import 'package:ecommerce_app/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [

              //edit profile
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: const Icon(Icons.edit,color: whiteColor,),
                ).onTap(() { }),
              ),
              //user details



              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Row(
                  children: [
                    Image.asset(dp,width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "example user".text.fontFamily(semibold).white.make(),
                        "example@gmail.com".text.white.make(),
                      ],
                    )),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: whiteColor,
                        )
                      ),
                      onPressed: ()async{
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(() => const login_screen());
                      }, 
                      child: logout.text.fontFamily(semibold).white.make()
                      )
                  ],
              
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailCard(count: "00",title: "in your cart",width:context.screenWidth/3.4),
                  detailCard(count: "10",title: "in your wishlist",width:context.screenWidth/3.4),
                  detailCard(count: "5",title: "you ordered",width:context.screenWidth/3.4)
                ],
              ),

              //buttons
              40.heightBox,
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context,index){
                  return const Divider(
                    color: lightGrey
                  );
      
                },
                itemCount: profileButtonsList.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    leading: Image.asset(
                      profileButtonsIcon[index],
                      width: 22,
                    ),
                    title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                  );
                },
                ).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(blackColor).make(),

            ],
          )
          ),
      )
    );
    
  }
}