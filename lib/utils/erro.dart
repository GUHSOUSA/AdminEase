import 'dart:convert';
import 'package:adminease/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErroHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch(response.statusCode){
    case 200:
    onSuccess();
    break;
    case 400:
      toastInfo(context, jsonDecode(response.body)["error"]);
    break;
    case 500:
      toastInfo(context, jsonDecode(response.body)["error"]);
    break;
    default:
      jsonDecode(response.body)["error"];
  }
}