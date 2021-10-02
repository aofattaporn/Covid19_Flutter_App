import 'package:flutter/material.dart';

import 'home/Body.dart';

class Home_screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        elevation: 0,
      ),

      body: stful_Body(),
    );
  }
}
