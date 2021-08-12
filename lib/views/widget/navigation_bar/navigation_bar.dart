import 'package:flutter/cupertino.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 150,
            child: Image.asset("assets/logo.png"),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _NavTitle("About"),
              SizedBox(
                width: 60,
              ),
              _NavTitle("Blocks"),
            ],
          )
        ],
      ),
    );
  }
}

class _NavTitle extends StatelessWidget {
  final String title;

  _NavTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 19),
    );
  }
}
