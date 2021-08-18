// To parse this JSON data, do
//
//     final blockchain = blockchainFromJson(jsonString);

import 'dart:convert';

BlockchainModel blockchainFromJson(String str) =>
    BlockchainModel.fromJson(json.decode(str));

String blockchainToJson(BlockchainModel data) => json.encode(data.toJson());

class BlockchainModel {
  BlockchainModel({
    this.chain,
    this.pendingTransactions,
    this.currentNodeUrl,
    this.networkNodes,
  });

  final List<Chain>? chain;
  final List<dynamic>? pendingTransactions;
  final String? currentNodeUrl;
  final List<dynamic>? networkNodes;

  factory BlockchainModel.fromJson(Map<String, dynamic> json) =>
      BlockchainModel(
        chain: List<Chain>.from(json["chain"].map((x) => Chain.fromJson(x))),
        pendingTransactions:
            List<dynamic>.from(json["pendingTransactions"].map((x) => x)),
        currentNodeUrl: json["currentNodeUrl"],
        networkNodes: List<dynamic>.from(json["networkNodes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "chain": List<dynamic>.from(chain!.map((x) => x.toJson())),
        "pendingTransactions":
            List<dynamic>.from(pendingTransactions!.map((x) => x)),
        "currentNodeUrl": currentNodeUrl,
        "networkNodes": List<dynamic>.from(networkNodes!.map((x) => x)),
      };
}

class Chain {
  Chain({
    required this.index,
    required this.timestamp,
    required this.transactions,
    required this.nonce,
    required this.hash,
    required this.previousBlockHash,
  });

  final int index;
  final int timestamp;
  final List<dynamic> transactions;
  final int nonce;
  final String hash;
  final String previousBlockHash;

  factory Chain.fromJson(Map<String, dynamic> json) => Chain(
        index: json["index"],
        timestamp: json["timestamp"],
        transactions: List<dynamic>.from(json["transactions"].map((x) => x)),
        nonce: json["nonce"],
        hash: json["hash"],
        previousBlockHash: json["previousBlockHash"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "timestamp": timestamp,
        "transactions": List<dynamic>.from(transactions.map((x) => x)),
        "nonce": nonce,
        "hash": hash,
        "previousBlockHash": previousBlockHash,
      };
}
