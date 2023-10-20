import 'package:adminease/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo(BuildContext context, String text,{ Color color = AppColors.navyBlue}){
  return Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 1,
  backgroundColor: color,
  textColor: Colors.white,
  fontSize: 16
  );
}