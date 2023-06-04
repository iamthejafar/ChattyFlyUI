import 'package:chattyfly/constants.dart';
import 'package:chattyfly/controller/home_screen_controller.dart';
import 'package:chattyfly/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlackDarkColor,
      body: SafeArea(
        child: GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (con) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.5.h),
                  child: Obx(
                    () {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Messages', style: AppTextStyle.k28pxWhite600,),
                              InkWell(
                                onTap: (){
                                  con.setShowTextFieldValue(!con.getShowTextFieldValue);

                                },
                                child: Image.asset('assets/images/search.png',scale: 1.5,),
                              )
                            ],
                          ),
                          con.getShowTextFieldValue?Column(
                            children: [
                              SizedBox(height: 1.h,),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 0.5.h),
                                  padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.5.h),
                                  decoration: BoxDecoration(
                                      color: AppColor.kBlackLightColor,
                                      borderRadius: BorderRadius.circular(1.h),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            offset: Offset(0.5.w, 0.5.w),
                                            spreadRadius: 0.5.h,
                                            blurRadius: 0.5.h
                                        )
                                      ]
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: AppColor.kGreyLightColor)
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: AppColor.kGreyLightColor)
                                        )
                                    ),


                                  )
                              ),
                              SizedBox(height: 1.h,),
                            ],
                          ):SizedBox(),
                          Text('R E C E N T',style: AppTextStyle.k13pxLightWhite500,),

                        ],
                      );
                    }
                  ),
                ),
                SizedBox(
                  height: 15.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              backgroundImage: Image.asset('assets/images/profile.jpg').image,
                              radius: 4.h,
                            ),
                            SizedBox(height: 1.5.h,),
                            Text('Barry', style: AppTextStyle.k15pxWhite400,)
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 2.h,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.kBlackLightColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5.h), topRight: Radius.circular(5.h)),
                    ),
                    padding: EdgeInsets.only(left: 5.w, top: 3.h, right: 5.w,bottom: 1.h),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            Get.toNamed(Routers.CHATSCREEN);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 2.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black.withOpacity(0.3),
                                                blurRadius: 1.h,
                                                spreadRadius: 0.5.h,
                                                offset: const Offset(4,4)
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(5.h)
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.blueAccent,
                                        backgroundImage: Image.asset('assets/images/profile.jpg').image,
                                        radius: 3.5.h,
                                      ),
                                    ),
                                    SizedBox(width: 3.w,),
                                    SizedBox(
                                      width: 60.w,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Danny Hopkins',
                                            style: AppTextStyle.k15pxWhite600,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'jafarjalali128@gmail.com',
                                            style: AppTextStyle.k13pxLightWhite500,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Text('08:43',style: AppTextStyle.k14pxLightGrey400,)

                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.kBlackLightColor,
        onPressed: (){
          Get.toNamed(Routers.ADDUSERSCREEN);

        },
        child: Image.asset('assets/images/add-user.png',height: 4.h,),
      ),
    );
  }
}
