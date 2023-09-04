import 'package:adminease/common/widgets/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widgets/text_widget.dart';

Widget appOnBoardPage(PageController controller, {String title = "", String subtitle = "", index = 0, required BuildContext context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: double.infinity,
        height: 300.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: const Icon(
          Icons.star,
          size: 80.0,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 20.0),
      text24Normal(text: title),
      const SizedBox(height: 10.0),
      text16Normal(text: subtitle),
      _nextButton(index, controller, context),
    ],
  );
}
Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        Navigator.pushNamed(context, "/singIn");
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
