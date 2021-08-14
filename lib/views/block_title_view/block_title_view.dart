import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockTitleView extends StatelessWidget {
  const BlockTitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.topLeft,
        width: 600,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Blockchain Explorer \nGreenCredits",
              style: TextStyle(
                  fontWeight: FontWeight.w800, height: 0.9, fontSize: 60),
            ),
          ],
        ));
  }
}
