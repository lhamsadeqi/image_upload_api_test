// ignore_for_file:prefer_const_constructors,  use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  //...
  File? _image;
  final ImagePicker _picker = ImagePicker();
  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  //...
  @override
  Widget build(BuildContext context) {
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
        onTap: getImage,
        child: Center(
          child: _image == null
              ? Icon(
                  Icons.file_upload_outlined,
                  size: 40,
                  color: Colors.teal,
                )
              : Image.file(_image!),
        ),
      ),
    );
  }
}
