import 'package:flutter/material.dart';

class BlockchainListView extends StatelessWidget {
  const BlockchainListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<int> colorCodes = <int>[600, 500, 100];
    return Container(
        width: 900,
        height: 300,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: index % 2 == 0 ? Colors.green[200] : Colors.green[400],
                  child: Row(children: [
                    Container(
                        padding: EdgeInsets.all(8),
                        child: Text('' + (index + 1).toString())),
                    Container(
                        padding: EdgeInsets.all(8),
                        child: Text('sdsd                          sdd'))
                  ]),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            )));
  }
}
