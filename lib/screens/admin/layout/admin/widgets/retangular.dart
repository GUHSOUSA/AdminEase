import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget retangular(String text, Function function){
  return  GestureDetector(
    onTap: ()=> function,
    child: Container(
      
      height: 25, 
      padding: EdgeInsets.symmetric(horizontal: 10,),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: const Color.fromARGB(255, 224, 224, 224)),
        borderRadius: BorderRadius.circular(20.w),
        color: Colors.white,
      ), margin: EdgeInsets.only(right: 10),
      child: Center(
        child: Text(text),
      ),
      ),
  );
            
}