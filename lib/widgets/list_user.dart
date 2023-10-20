import 'dart:ffi';

import 'package:adminease/models/employee.dart';
import 'package:adminease/screens/admin/screens/employee/screens/dettails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

Widget listUser(BuildContext context,  {
  bool check = false,
  String name = "user",
  String desc = "",
  int sal = 0,
  String img = "",
  bool salary = false,

  void Function()? onTap
  
}){
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
    child: GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(img)),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: TextStyle(color: Colors.black, fontSize: 14.sp),),
                    if(check == true) Icon (Icons.check),
                    if(salary == true) Text("$sal R\$")
                  ],
                ),
                Text(desc, style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),)
              ],
            ),
          )
    
        ],
      ),
    ),
  );
}