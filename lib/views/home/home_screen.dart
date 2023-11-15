import 'package:ecommerce_app/consts/colors.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/views/home/components/featuredButtons.dart';
import 'package:ecommerce_app/widgets/homeButtons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12), 
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight, 
      child: SafeArea(
          child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        color: lightGrey,
                        child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.search),
                                  filled: true,
                                  fillColor: whiteColor, 
                                  hintText: searchanything,
                                  hintStyle: TextStyle(
                                    color: textfieldGrey
                                  ),
                                ),
                            ),
                        ),

                      //swiper brands
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                                //1st swiper
                                VxSwiper.builder(
                                aspectRatio: 16/9,
                                autoPlay: true,
                                height: 150,
                                enlargeCenterPage: true,
                                itemCount: slider1.length, 
                                itemBuilder: (context,index){
                                return Image.asset(slider1[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                              }),
                              10.heightBox,

                              //home buttons

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(2, (index) => homeButtons(
                                height: context.screenHeight * 0.15,
                                width: context.screenWidth / 2.5,
                                icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                title: index == 0 ? todayDeal : flashsale,
                              )),),
                              10.heightBox,

                              //2nd swiper

                              VxSwiper.builder(
                                aspectRatio: 16/9,
                                autoPlay: true,
                                height: 150,
                                enlargeCenterPage: true,
                                itemCount: slider2.length, 
                                itemBuilder: (context,index){
                                return Image.asset(slider2[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                              }),
                              10.heightBox,

                              //home buttons

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(3, (index) => homeButtons(
                                  height: context.screenHeight * 0.15,
                                  width: context.screenWidth / 3.5,
                                  icon: index == 0 ? icTopCategories : index == 1 ? icBrands : icTopSeller,
                                  title: index == 0 ? topCategories : index == 1 ? brand : topSellers,
                                )),
                              ),
                              20.heightBox,
                              Align(
                                alignment: Alignment.centerLeft,
                                child: featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make()),
                              20.heightBox,

                              //featured categories

                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(3, (index) => Column(
                                    children: [
                                      featuredButton(title: freaturedTitles1[index],icon: featuredImages1[index]),
                                      10.heightBox,
                                      featuredButton(title: freaturedTitles2[index],icon: featuredImages2[index]),
                                    ],
                                  )).toList(),
                                ),
                              ),

                              20.heightBox,

                              //featured products

                              Container(
                                padding: const EdgeInsets.all(12),
                                width: double.infinity,
                                decoration: const BoxDecoration(color: blackColor),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    featuredProducts.text.white.fontFamily(bold).size(18).make(),
                                    10.heightBox,
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: List.generate(6, (index) => Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              imgP1,
                                              width: 130,
                                              fit: BoxFit.cover,),
                                              10.heightBox,
                                              "laptop 8gb/256gb".text.fontFamily(semibold).color(darkFontGrey).make(),
                                              10.heightBox,
                                              "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                                              10.heightBox
                                          ],
                                        ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make()),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              //3rd swiper

                              20.heightBox,
                              VxSwiper.builder(
                                aspectRatio: 16/9,
                                autoPlay: true,
                                height: 150,
                                enlargeCenterPage: true,
                                itemCount: slider2.length, 
                                itemBuilder: (context,index){
                                return Image.asset(slider2[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                              }),

                              //all products
                              20.heightBox,
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 6,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300), 
                                itemBuilder: (context,index){
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      imgP5,
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,),
                                      const Spacer(),
                                      "laptop 8gb/256gb".text.fontFamily(semibold).color(darkFontGrey).make(),
                                      10.heightBox,
                                      "\$600".text.color(redColor).fontFamily(bold).size(16).make()
                                  ],
                                ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(12)).make();
                              })

                            ],
                          ),
                        ),
                      )

                    ]
                  )
                )
      );  
  }
}