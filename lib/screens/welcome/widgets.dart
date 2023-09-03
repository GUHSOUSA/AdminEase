import 'package:adminease/common/widgets/app_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widgets/text_widget.dart';

Widget appOnBoardPage(PageController controller, {String title = "", String subtitle = "", index=0}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Ícone grande
      Container(
        width: double.infinity,
        height: 300.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue, // Personalize a cor do ícone
        ),
        child: Icon(
          Icons.star,
          size: 80.0, // Personalize o tamanho do ícone
          color: Colors.white, // Personalize a cor do ícone
        ),
      ),
      SizedBox(height: 20.0),

      // Título
        text24Normal(text: title),


      SizedBox(height: 10.0),

      // Subtítulo
      text16Normal(text: subtitle),

      _nextButton(index, controller)
    ],
  );
}

Widget _nextButton(int index, PageController controller){
  return GestureDetector(
    onTap: (){
      if(index<3){
        controller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
    },
    child: Container(
      width: 325,
      height: 50,
      decoration: appShadow(),
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      child: Center(child: text16Normal(text: "Proximo", color: Colors.white)),
    ),
  );
}