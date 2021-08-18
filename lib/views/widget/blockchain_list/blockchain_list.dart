import 'package:blockchain_explorer/view_model/blockchain_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlockchainListView extends StatelessWidget {
  const BlockchainListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _blockchainListObj = Provider.of<BlockchainViewModel>(context);
    return _mainUI(_blockchainListObj);
  }

  Widget _mainUI(BlockchainViewModel _blocchainObj) {
    print(_blocchainObj.loadingStatus);
    switch (_blocchainObj.loadingStatus) {
      case LoadingStatus.loading:
        return Center(
          child: Text("...."),
        );

      case LoadingStatus.completed:
        return _blockListUI(_blocchainObj);
      case LoadingStatus.empty:
        return _emptyListUI();
      default:
        return _errorListUI();
    }
  }

  Container _blockListUI(BlockchainViewModel _blocchainObj) {
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
              itemCount: _blocchainObj.blockchainModel.chain!.length,
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
                        child: Text(_blocchainObj
                                    .blockchainModel.chain![index].hash ==
                                "0"
                            ? 'Genesis Block'
                            : _blocchainObj.blockchainModel.chain![index].hash))
                  ]),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            )));
  }

  Widget _emptyListUI() {
    return Text("Blockchain not available!");
  }

  Widget _errorListUI() {
    return Text("Unable to get Blockchain, please try again!");
  }
}
