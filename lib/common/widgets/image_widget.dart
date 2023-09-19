import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appImage({
  String imagePath = "https://cdn-icons-png.flaticon.com/512/1077/1077114.png",
  double width = 16,
  double height = 16
}){
  return Image.network(imagePath.isEmpty ? "https://cdn-icons-png.flaticon.com/512/1077/1077114.png" : imagePath, width: width.w, height: height.h,);
}