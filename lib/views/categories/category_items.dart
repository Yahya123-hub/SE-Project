import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/views/categories/product_details.dart';
import 'package:ecommerce_app/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class categoryDetails extends StatelessWidget {
  final String? title;
  //const categoryDetails({super.key});
  const categoryDetails({Key? key, required this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) => "baby clothing".text.size(12).fontFamily(semibold).color(darkFontGrey).makeCentered().box.size(120, 60).margin(EdgeInsets.symmetric(horizontal: 4)).white.rounded.make()),
                ),
              ),

              //items container
              20.heightBox,
              Expanded(child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250,mainAxisSpacing: 8,crossAxisSpacing: 8), 
                itemBuilder: (context,index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imgP5,
                      height: 150,
                      width: 200,
                      fit: BoxFit.cover,),
                     
                      "laptop 8gb/256gb".text.fontFamily(semibold).color(darkFontGrey).make(),
                      10.heightBox,
                      "\$600".text.color(redColor).fontFamily(bold).size(16).make()
                  ],
                ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.outerShadowSm.padding(const EdgeInsets.all(12)).make().onTap(() {
                  Get.to(()=>productDetails(title: "example product"));
                });
                              
              }))
            ],
          ),
        ),
      )
    );
  }
}