import 'package:blog/screens/main_page/footer.dart';
import 'package:blog/screens/main_page/navbar.dart';
import 'package:blog/screens/main_page/projects.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
//          color: Color(0xffA7D3A6),
            ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Navbar(),
              Projects(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
