import 'package:blockchain_explorer/views/block_title_view/block_title_view.dart';
import 'package:blockchain_explorer/views/widget/action_button/action_button.dart';
import 'package:blockchain_explorer/views/widget/blockchain_list/blockchain_list.dart';
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
          children: [
            NavigationBar(),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: BlockTitleView(),
                    ),
                    Container(child: BlockchainListView()),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 420,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ActionButton(
                              title: 'Add Peer',
                              onPress: () {
                                print("Button 1");
                              }),
                          ActionButton(
                              title: 'Mine Block',
                              onPress: () {
                                print("Button 2");
                              }),
                          ActionButton(
                              title: 'Transaction',
                              onPress: () {
                                print("Button 3");
                              }),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
