import 'package:adminease/screens/login/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(padding: EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/left-arrow.png", height: 15.h, width: 15.h,),
                   ],
            ),
          Padding(
            padding: EdgeInsets.only(top: 20.h,),
            child: Text("Criar bando de dados",style: GoogleFonts.roboto(
                                // Ou qualquer outra fonte que preferir.
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),),
          ),
          Text("Necessario para guardar dados",style: GoogleFonts.roboto(
                                // Ou qualquer outra fonte que preferir.
                                textStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.sp,
                                  
                                ),
                              ),),
                              SizedBox(height: 40.h,),
                              Text("Escola",style: GoogleFonts.roboto(
                                // Ou qualquer outra fonte que preferir.
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600
                                ),
                              ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: appTextField(hintText: "Escola"),
                              ),
                              Text("Diretor",style: GoogleFonts.roboto(
                                // Ou qualquer outra fonte que preferir.
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600
                                ),
                              ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: appTextField(hintText: "Diretor"),
                              ),


        ]),
        ),
      ),
    );
  }
}