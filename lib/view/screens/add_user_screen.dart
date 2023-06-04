import 'package:chattyfly/constants.dart';
import 'package:chattyfly/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kBlackDarkColor.withOpacity(0.9),
        elevation: 0.2,
        title: Text('Search User',style: AppTextStyle.k15pxWhite600,),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.more_vert_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 2.w),
                padding: EdgeInsets.only(top: 0.5.h,bottom: 0.5.h,left: 3.w,right: 1.5.w),
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
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      child: Image.asset('assets/images/search.png',scale: 1.5,),
                    ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.kGreyLightColor)
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.kGreyLightColor)
                      )
                  ),


                )
            ),
            SizedBox(height: 1.5.h),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.active){
                  if(snapshot.hasData){
                    UserModel userModel = UserModel.fromFirestore(snapshot);
                    print('snap Length :  ');
                    print(snapshot.data!.docs.length);
                    return Container();

                  }
                  else{
                    return Center(
                      child: Text('No User Found !'),
                    );
                  }
                }
                else{
                  return const CircularProgressIndicator();
                }
              },
            )

          ],
        ),
      ),
    );
  }
}
