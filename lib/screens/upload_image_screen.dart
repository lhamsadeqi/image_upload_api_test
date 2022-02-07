// ignore_for_file:prefer_const_literals_to_create_immutables,  use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import '../Buttons/submit_btn.dart';
import '../widget/image_upload.dart';

class UploadImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          SizedBox(height: 25),
          ImageUpload(),
          ImageUpload(),
          ImageUpload(),
          ImageUpload(),
          ImageUpload(),
          ImageUpload(),
          SizedBox(height: 20),
          SubmitBtn(),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
