

import 'package:flutter/material.dart';

import 'home/Body.dart';

class Home_screens  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: buidAppBar(),


      body: stful_Body(),


    );
  }

  AppBar buidAppBar() {
    return AppBar(
        elevation: 0,
    );
  }
}
