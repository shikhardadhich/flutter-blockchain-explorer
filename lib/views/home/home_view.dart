import 'package:blockchain_explorer/views/widget/centered_view/centered_view.dart';
import 'package:blockchain_explorer/views/widget/navigation_bar/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: [NavigationBar()],
        ),
      ),
    );
  }
}
