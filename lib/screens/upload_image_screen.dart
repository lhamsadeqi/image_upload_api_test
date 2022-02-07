// ignore_for_file:prefer_const_literals_to_create_immutables,  use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testing/services/files_service.dart';

import '../Buttons/submit_btn.dart';
import '../models/insurer_model.dart';

class UploadImageScreen extends StatefulWidget {
  final InsuredModel? insurerModel;

  UploadImageScreen(this.insurerModel);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  Map<String, File?> _images = {};

  final ImagePicker _picker = ImagePicker();

  UploaderBox(String title) {
    Future getImage() async {
      var image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _images[title] = File(image!.path);
      });
    }

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        border: Border.all(
          width: 3,
          color: Colors.grey.shade700,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => getImage(),
        child: Center(
          child: _images[title] == null
              ? Icon(
                  Icons.file_upload_outlined,
                  size: 40,
                  color: Colors.teal,
                )
              : Image.file(_images[title]!),
        ),
      ),
    );
  }

  sendAction() async {
    FilesService.addFiles(images: _images, id: widget.insurerModel!.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Text(
          'بیمه',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            SizedBox(height: 25),
            UploaderBox('previousInsurancePolicyImage'),
            UploaderBox('nationalCardImage'),
            UploaderBox('drivingLicenseImage'),
            UploaderBox('theImageOnTheBackOfTheDrivingLicense'),
            UploaderBox('carCardImage'),
            UploaderBox('theImageOnTheBackOfTheCarCard'),
            SizedBox(height: 20),
            SubmitBtn(
              onTap: () => sendAction(),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
