import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../constant/theme.dart';

Future<void> handleResponse(http.Response response, context) async {
  String message = jsonDecode(response.body)['message'];
  if (response.statusCode == 200 || response.statusCode == 200) {
    Get.back();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          1,
        ),
        margin: const EdgeInsets.all(
          paddingBase,
        ),
        elevation: 10,
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          1,
        ),
        margin: const EdgeInsets.all(
          paddingBase,
        ),
        elevation: 10,
      ),
    );
  }
}
