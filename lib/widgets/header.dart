import 'package:adminease/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

Widget header(
  BuildContext context,{
  String title = "AdminEase",
  bool back = false,
  bool menu = false,
  bool settings = false,
  IconData icon = IconlyLight.more_square

}){
  return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.h),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (back == true ) GestureDetector(
                    onTap: ()=> Navigator.pop(context),
                    child: Icon(IconlyLight.arrow_left, color: AppColors.navyBlue,)),
                  Center(child: Text(title, style: GoogleFonts.aBeeZee(
                    fontSize: 15.sp,
                    color: AppColors.navyBlue, ),)),
                  Row(
                    children: [
                       if (menu == true ) Padding(
                        padding: EdgeInsets.only(left: 10.h,),
                        child: Icon(icon, color: AppColors.navyBlue,),
                      ),
                       if (settings == true ) GestureDetector(
                    onTap: ()=> Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Icon(IconlyLight.setting, color: AppColors.navyBlue,),
                    )),
                    ],
                  ),

                ],
              ),
            );
           
}