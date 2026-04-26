import 'package:flutter/material.dart';

class CateGoryView extends StatefulWidget {
  CateGoryView({Key? key}) : super(key: key);

  @override
  _CateGoryViewState createState() => _CateGoryViewState();
}

class _CateGoryViewState extends State<CateGoryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
        child: Text("分类"),
       ),
    );
  }
}