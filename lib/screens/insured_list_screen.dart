// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:testing/screens/upload_image_screen.dart';
import '../models/insurer_model.dart';
import '../services/insure_service.dart';
import '../widget/dialoge_widget.dart';

class InsuredListScreen extends StatefulWidget {
  @override
  _InsuredListScreenState createState() => _InsuredListScreenState();
}

class _InsuredListScreenState extends State<InsuredListScreen> {
  //...
  bool loading = true;

  //...
  List<InsuredModel>? _insuredModel;

  //...
  @override
  void initState() {
    getInsures();
    super.initState();
  }

  //...
  getInsures() async {
    try {
      setState(() {
        loading = true;
      });
      List<InsuredModel> insuredModel = await InsurerService.getAll();
      setState(() {
        _insuredModel = insuredModel;
        loading = false;
      });
    } catch (e) {
      DialogWidget(
        context,
        title: "خطا",
        message: e.toString(),
        onTap: getInsures,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            )
          : Column(
              children: [
                SizedBox(height: 25),
                Expanded(
                  child: ListView.builder(
                    itemCount: _insuredModel?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Card(
                          color: Colors.grey.shade800,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UploadImageScreen(_insuredModel?[index]),
                                ),
                              );
                            },
                            title: Text(
                              _insuredModel?[index].fullname ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              _insuredModel?[index].nationalCode ?? '',
                              style: TextStyle(color: Colors.white54),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
