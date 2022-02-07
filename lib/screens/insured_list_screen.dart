// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../models/insurer_model.dart';
import '../services/insure_service.dart';
import '../widget/dialoge_widget.dart';

class InsuredListScreen extends StatefulWidget {
  @override
  _InsuredListScreenState createState() => _InsuredListScreenState();
}

class _InsuredListScreenState extends State<InsuredListScreen> {
  bool loading = true;
  List<InsuredModel>? _insuredModel;
  @override
  void initState() {
    getInsures();
    super.initState();
  }

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
      appBar: AppBar(
        title: Text('سامانه بیمه گری'),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _insuredModel?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_insuredModel?[index].fullname ?? ''),
                  subtitle: Text(_insuredModel?[index].nationalCode ?? ''),
                );
              },
            ),
    );
  }
}
