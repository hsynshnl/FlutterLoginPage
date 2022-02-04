import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xff232323),
      child: Center(
        child: Text(
          "Search Page",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
    );
  }
}
