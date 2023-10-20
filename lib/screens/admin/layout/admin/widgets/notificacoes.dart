import 'dart:ffi';

import 'package:adminease/models/employee.dart';
import 'package:adminease/screens/admin/screens/employee/screens/dettails.dart';
import 'package:adminease/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

Widget newsWidget(BuildContext context,  {
  String name = "user",
  String desc = "",
  String hour = "uma semana",
  String img = "",
  

  void Function()? onTap
  
}){
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Color.fromARGB(255, 237, 237, 237))
        ),
        width: double.infinity,
        child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 16,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.sp),),
                      ),
                    ],
                  ),
                  Icon(IconlyLight.more_square, color: AppColors.navyBlue,)


                ],
              ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),

              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(IconlyLight.login), 
                      Text("data")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(IconlyLight.login), 
                      Text("data")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(IconlyLight.login), 
                      Text("data")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(IconlyLight.login), 
                      Text("data")
                    ],
                  )
                ],
              ),
              )

            ],
        )),
    ),
  );
}