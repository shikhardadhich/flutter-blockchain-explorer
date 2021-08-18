// To parse this JSON data, do
//
//     final block = blockFromJson(jsonString);

import 'dart:convert';

BlockModel blockFromJson(String str) => BlockModel.fromJson(json.decode(str));

String blockToJson(BlockModel data) => json.encode(data.toJson());

class BlockModel {
  BlockModel({
    this.note,
    this.block,
  });

  final String? note;
  final BlockClass? block;

  factory BlockModel.fromJson(Map<String, dynamic> json) => BlockModel(
        note: json["note"],
        block: BlockClass.fromJson(json["block"]),
      );

  Map<String, dynamic> toJson() => {
        "note": note,
        "block": block!.toJson(),
      };
}

class BlockClass {
  BlockClass({
    this.index,
    this.timestamp,
    this.transactions,
    this.nonce,
    this.hash,
    this.previousBlockHash,
  });

  final int? index;
  final int? timestamp;
  final List<Transaction>? transactions;
  final int? nonce;
  final String? hash;
  final String? previousBlockHash;

  factory BlockClass.fromJson(Map<String, dynamic> json) => BlockClass(
        index: json["index"],
        timestamp: json["timestamp"],
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
        nonce: json["nonce"],
        hash: json["hash"],
        previousBlockHash: json["previousBlockHash"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "timestamp": timestamp,
        "transactions":
            List<dynamic>.from(transactions!.map((x) => x.toJson())),
        "nonce": nonce,
        "hash": hash,
        "previousBlockHash": previousBlockHash,
      };
}

class Transaction {
  Transaction({
    this.amount,
    this.sender,
    this.recipient,
    this.transactionId,
  });

  final double? amount;
  final int? sender;
  final String? recipient;
  final String? transactionId;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        amount: json["amount"].toDouble(),
        sender: json["sender"],
        recipient: json["recipient"],
        transactionId: json["transactionId"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "sender": sender,
        "recipient": recipient,
        "transactionId": transactionId,
      };
}
