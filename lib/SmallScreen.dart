import 'package:flutter/material.dart';

class SmallScreem extends StatelessWidget {
  const SmallScreem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.green,
    );
  }
}
