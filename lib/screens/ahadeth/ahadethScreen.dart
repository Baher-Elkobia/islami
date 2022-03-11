import 'package:flutter/material.dart';

class AhadethScreen extends StatelessWidget {
  const AhadethScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(flex:6,child: Container(color: Colors.blue,)),
          Expanded(flex:4,child: Container(color: Colors.red,)),
        ],
      ),
    );
  }
}
