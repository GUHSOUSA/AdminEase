
import 'package:flutter/material.dart';


BoxDecoration appShadow(){
  return BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.blue.withOpacity(0.6),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 1)
      )
    ]
  );
}