import 'dart:convert';
import 'package:blockchain_explorer/constant/strings.dart';
import 'package:http/http.dart' as http;

class APIManager {
  Future<dynamic> getAllBlocks() async {
    var client = http.Client();

    try {
      var response = await client
          .get(Uri.parse(Strings.blockchainURL))
          .timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        var jsonStr = response.body;
        return json.decode(jsonStr);
      }
    } catch (e) {
      print("EXCEPTION IN API");
      throw Exception("Unable to fetch blocks!" + e.toString());
    }
  }

  Future<dynamic> createBlock() async {
    var client = http.Client();

    try {
      var response = await client
          .get(Uri.parse(Strings.createBlockURL))
          .timeout(const Duration(seconds: 50));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return json.decode(jsonString);
      }
    } catch (e) {
      throw Exception("Unable to mine a block!" + e.toString());
    }

    return new Exception();
  }
}
