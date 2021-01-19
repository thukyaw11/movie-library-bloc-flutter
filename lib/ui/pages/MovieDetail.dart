import 'dart:ui';

import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Detail",
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
