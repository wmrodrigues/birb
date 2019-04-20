import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoContent extends StatelessWidget {
  const NoContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/undraw_photo_4yb9.svg',
            height: 300.0,
          ),
          const Text('No Birbs a birbing'),
        ],
      ),
    );
  }
}