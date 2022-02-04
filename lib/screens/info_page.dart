import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff232323),
        title: Text("Movie Name Here"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff232323),
        child: Text(
          "info page",
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
