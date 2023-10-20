
import 'package:adminease/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void modalSheetsWidget(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: MediaQuery.of(context).size.height *
                0.5, // cobrindo metade da tela
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Container(
                    height: 3.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Todas Funcionalidades",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp),
                      ),
                      Text(
                        "Fechar",
                        style: TextStyle(
                            color: AppColors.navyBlue,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }