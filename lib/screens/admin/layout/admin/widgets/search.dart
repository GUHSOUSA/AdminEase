import 'package:adminease/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

Widget search(){
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: TextField(
                        cursorColor: Colors.blue, // Cor do cursor (barra lateral)
                        cursorWidth: 2.0, // Espessura do cursor
                        showCursor: true,
                        style: const TextStyle(
                          color: Colors.black, // Cor do texto
                        ),
                        decoration: InputDecoration(
                          hintText: "Busque Funcionarios e Tasks",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                          ),
                          suffixIcon: const Icon(
                            IconlyLight.search,
                            color: AppColors.navyBlue,
                          ),
                          fillColor:
                              Colors.grey[200], // Cor de fundo do TextField
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none, // Remove a borda padrão
                            borderRadius:
                                BorderRadius.circular(5.0), // Borda arredondada
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide
                                .none, // Remove a borda quando o TextField está focado
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide
                                .none, // Remove a borda quando o TextField está habilitado
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.h),
                    child: const Icon(
                      IconlyLight.filter,
                      size: 25,
                      color: AppColors.navyBlue,
                    ),
                  )
                ],
              ),
  );
           
}