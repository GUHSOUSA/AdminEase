import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String title){
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.blue,
        height: 0.8.h,
      ),
    ),
      centerTitle: true,
      title: Text( title),
  );
}
Widget thirdPartyLogin(){
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h, bottom: 20.h),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _loginButton("https://cdn-icons-png.flaticon.com/512/4701/4701482.png"),
      _loginButton("https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png"),
      _loginButton("https://cdn-icons-png.flaticon.com/512/154/154870.png")
    ],
  ),
  );
}
Widget _loginButton(String imagePath){
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(97, 189, 186, 0.163),
        borderRadius: BorderRadius.circular(5.w)
      ),
      width: 40.w,
      height: 40.w,
      child: Image.network(imagePath),
    ),
  );
}
Widget appTextField({String text="", String iconName="", String hintText="", bool obscure = false}){
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Container(
          width: 325.w,
          height: 50.h,
          decoration: appBoxDecorationTextField(color: Colors.white),
          child: 
            Container(
              width: 250.w,  
              height: 50.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration:  InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent
                    )
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent
                    )
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent
                    )
                  )
                ),
                onChanged: (value){

                },
                maxLines: 1,
                autocorrect: false,
                obscureText: obscure,
              ),
            )
          ),
      ]
      
  );
}


BoxDecoration appBoxDecorationTextField({
  Color color = Colors.white,
  double radius = 15,
  Color borderColors = Colors.black12,
}){
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColors)
  );
}
BoxDecoration appDecorationTextField({
  Color color = Colors.grey,
  double radius = 15,
  double sR = 1,
  double bR = 2
}){
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1)
      )
      
    ]
  );
}