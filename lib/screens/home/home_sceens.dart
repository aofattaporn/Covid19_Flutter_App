

import 'package:flutter/material.dart';

import 'components/Body.dart';

class Home_screens  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidAppBar(),

      body: s_Body(),


    );
  }

  AppBar buidAppBar() {
    return AppBar(
        elevation: 0,
    );
  }
}
