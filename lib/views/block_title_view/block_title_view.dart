import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockTitleView extends StatelessWidget {
  const BlockTitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Blockchain Explorer \nGreenCredits",
          style:
              TextStyle(fontWeight: FontWeight.w800, height: 0.9, fontSize: 60),
        ),
      ],
    ));
  }
}
