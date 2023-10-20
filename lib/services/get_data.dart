
import 'dart:convert';
import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/utils/toast.dart';
import 'package:adminease/utils/uri.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GetUserData {
Future<void> getUserData(BuildContext context) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('x-auth-token');
    
    if (token == null) {
      prefs.setString('x-auth-token', '');
      return;
      
    }


    var tokenRes = await http.post(
      Uri.parse('$uri/api/auth/tokenIsValid'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token,
      },
    );
   

    var response = jsonDecode(tokenRes.body);

    if (response == true) {
      http.Response userRes = await http.get(
        Uri.parse('$uri/api/auth/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );

      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(userRes.body);
    }
    
} catch (e) {
      toastInfo(context, e.toString());
    }
}
}