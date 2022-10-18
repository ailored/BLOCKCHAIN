import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:blockchain/block.dart';
import 'package:blockchain/transaction.dart';

class Blockchain {
  List<Block> doeChain = [];
  List<Transaction> doeCurrentTransactions = [];

  Blockchain();
  Blockchain.doeGenesisBlock() { doeNewBlock(doeProof: 25072003, doePreviousHash: 'derkach'); }

  Block doeLastBlock() => doeChain.last;

  Block doeNewBlock({int doeProof=0, String doePreviousHash=''}) {
    List<Transaction> doeTransactions = doeCurrentTransactions.toList();

    Block doeNewBlock = Block(doeChain.length, doeProof, doePreviousHash, doeTransactions);

    doeCurrentTransactions.clear();
    doeChain.add(doeNewBlock);

    return doeNewBlock;
  }

  int doeNewTransaction(String doeSender, String doeRecipient, int doeAmount) {
    doeCurrentTransactions.add(Transaction(doeCurrentTransactions.length+1, doeSender, doeRecipient, doeAmount));

    return doeChain.length;
  }

  String doeHashBlock(int doeIndex, int doeProof, String doePreviousHash) {
    StringBuffer doeHashBlock = StringBuffer()
      ..write(doeIndex)
      ..write(doeProof)
      ..write(doePreviousHash);

    return sha256.convert(utf8.encode(doeHashBlock.toString())).toString();
  }

  int doeProofOfWork(int doeIndex, int doeLastPOW, String doePreviousHash) {
    int doeProof = 0;
    while (!isProofValid(doeIndex, doeLastPOW, doeProof, doePreviousHash)) {
      doeProof++;
    }

    return doeProof;
  }

  bool isProofValid(int doeIndex, int doeLastPOW, int doeProof, String doePreviousHash) =>
      sha256
          .convert(utf8.encode('$doeIndex$doeProof$doePreviousHash'))
          .toString()
          .endsWith('07');

  @override
  String toString() => "BLOCKCHAIN: $doeChain";
}
