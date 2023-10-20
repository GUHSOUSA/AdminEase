import 'package:adminease/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

Widget rounded({void Function()? onEmplyee, void Function()? onTask, void Function()? onNoticias, 
  void Function()? onMore
}){
  return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: onEmplyee,
                        child: const CircleAvatar(
                          backgroundColor: AppColors.cyanBlue,
                          radius: 30,
                          child: Icon(
                            IconlyBroken.user_2,
                            color: Color.fromARGB(255, 0, 0, 202),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Add",
                              style: TextStyle(fontSize: 11.sp),),
                              Text(
                                
                                "Funcionario",
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: onNoticias,
                        child: CircleAvatar(
                          backgroundColor: AppColors.cyanBlue,
                          radius: 30,
                          child: Icon(
                            IconlyBroken.message,
                            color: AppColors.navyBlue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text("Add",
                              style: TextStyle(fontSize: 11.sp),),
                              Text(
                                "Noticias",
                                style: TextStyle(fontSize: 11.sp),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: onTask,
                        child: CircleAvatar(
                          backgroundColor: AppColors.cyanBlue,
                          radius: 30,
                          child: Icon(
                            IconlyBroken.tick_square,
                            color: AppColors.navyBlue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text("Add",
                              style: TextStyle(fontSize: 11.sp),),
                              Text(
                                "Tasks",
                                style: TextStyle(fontSize: 11.sp),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: onMore,
                        child: CircleAvatar(
                          backgroundColor: AppColors.cyanBlue,
                          radius: 30,
                          child: Icon(
                            IconlyBroken.category,
                            color: AppColors.navyBlue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text("Ver",
                              style: TextStyle(fontSize: 11.sp),),
                              Text(
                                "Todos",
                                style: TextStyle(fontSize: 11.sp),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
           
}