import 'dart:convert';

import 'package:adminease/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErroHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch(response.statusCode){
    case 201:
    onSuccess();
    break;
    case 400:
    showSnackBar(context, jsonDecode(response.body)["error"]);
    break;
    case 500:
    showSnackBar(context, jsonDecode(response.body)["error"]);
    break;
    default:
    showSnackBar(context, response.body);
  }
}