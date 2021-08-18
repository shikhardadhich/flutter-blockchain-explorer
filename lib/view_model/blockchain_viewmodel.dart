import 'package:blockchain_explorer/core/model/blockchain_model.dart';
import 'package:blockchain_explorer/core/services/api-manager.dart';
import 'package:flutter/material.dart';

enum LoadingStatus { completed, loading, empty, error }

class BlockchainViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.loading;
  BlockchainModel blockchainModel = BlockchainModel();

  void getAllBlocks() async {
    try {
      await APIManager().getAllBlocks().then((value) {
        this.blockchainModel = value;
      });

      if (this.blockchainModel.chain!.length == 0) {
        this.loadingStatus = LoadingStatus.empty;
      } else {
        this.loadingStatus = LoadingStatus.completed;
      }
    } catch (e) {
      print("EXCEPTION IN VIEW MODEL");
      this.loadingStatus = LoadingStatus.error;
      throw Exception("Unable to fetch blocks!" + e.toString());
    } finally {
      notifyListeners();
    }
  }
}
