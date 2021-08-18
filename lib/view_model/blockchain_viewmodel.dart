import 'package:blockchain_explorer/core/model/block_model.dart';
import 'package:blockchain_explorer/core/model/blockchain_model.dart';
import 'package:blockchain_explorer/core/services/api-manager.dart';
import 'package:flutter/material.dart';

enum LoadingStatus { completed, loading, empty, error }

class BlockchainViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.loading;
  BlockchainModel blockchainModel = BlockchainModel();
  BlockModel blockModel = BlockModel();

  void getAllBlocks() async {
    try {
      await APIManager().getAllBlocks().then((value) {
        this.blockchainModel = BlockchainModel.fromJson(value);
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

  void addBlock() async {
    try {
      this.loadingStatus = LoadingStatus.loading;
      await APIManager().createBlock().then((value) {
        this.blockModel = BlockModel.fromJson(value);
      });

      getAllBlocks();
      this.loadingStatus = LoadingStatus.completed;
    } catch (e) {
      this.loadingStatus = LoadingStatus.error;
      throw Exception("Unable to mine block!" + e.toString());
    }
  }
}
