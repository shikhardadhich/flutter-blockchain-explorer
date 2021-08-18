import 'dart:convert';

import 'package:blockchain_explorer/constant/strings.dart';
import 'package:blockchain_explorer/core/model/blockchain_model.dart';
import 'package:http/http.dart' as http;

class APIManager {
  Future<BlockchainModel> getAllBlocks() async {
    var client = http.Client();

    try {
      var response = await client
          .get(Uri.parse(Strings.blockchainURL))
          .timeout(const Duration(seconds: 4));

      if (response.statusCode == 200) {
        var jsonStr = response.body;
        var jsonMap = json.decode(jsonStr);
        return BlockchainModel.fromJson(jsonMap);
      }
    } catch (e) {
      print("EXCEPTION IN API");
      throw Exception("Unable to fetch blocks!" + e.toString());
    }
    throw Exception("Unable to fetch blocks!");
  }
}
