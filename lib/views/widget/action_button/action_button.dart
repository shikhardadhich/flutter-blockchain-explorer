import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, this.title = "", this.onPress})
      : super(key: key);
  final String title;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 31, 229, 146),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
