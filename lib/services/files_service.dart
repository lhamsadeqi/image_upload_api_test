import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FilesService {
  static addFiles({
    required Map<String, File?> images,
    required int id,
  }) async {
    Dio dio = new Dio();
    try {
      var formData = FormData.fromMap({
        'InsurerId': id,
        'previousInsurancePolicyImage': await MultipartFile.fromFile(
          images['previousInsurancePolicyImage']!.path,
          filename:
              images['previousInsurancePolicyImage']!.path.split('/').last,
        ),
        'nationalCardImage': await MultipartFile.fromFile(
          images['nationalCardImage']!.path,
          filename: images['nationalCardImage']!.path.split('/').last,
        ),
        'drivingLicenseImage': await MultipartFile.fromFile(
          images['drivingLicenseImage']!.path,
          filename: images['drivingLicenseImage']!.path.split('/').last,
        ),
        'theImageOnTheBackOfTheDrivingLicense': await MultipartFile.fromFile(
          images['theImageOnTheBackOfTheDrivingLicense']!.path,
          filename: images['theImageOnTheBackOfTheDrivingLicense']!
              .path
              .split('/')
              .last,
        ),
        'carCardImage': await MultipartFile.fromFile(
          images['carCardImage']!.path,
          filename: images['carCardImage']!.path.split('/').last,
        ),
        'theImageOnTheBackOfTheCarCard': await MultipartFile.fromFile(
          images['theImageOnTheBackOfTheCarCard']!.path,
          filename:
              images['theImageOnTheBackOfTheCarCard']!.path.split('/').last,
        ),
      });

      Response response = await dio
          .post("https://api.bimegari.app/api/Files/AddFile", data: formData);
      print(response.statusCode);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "با موفقیت ثبت شد",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        return true;
      } else {
        Fluttertoast.showToast(
            msg: "خطا در برقراری ارتباط با سرور",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        throw Exception('خطا در برقراری ارتباط با سرور');
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "خطا در برقراری ارتباط با سرور",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(e);
    }
  }
}
