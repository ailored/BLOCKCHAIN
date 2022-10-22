import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:blockchain/block.dart';
import 'package:blockchain/transaction.dart';

class Blockchain {
  List<Block> doeChain = [];
  List<Transaction> doeCurrentTransactions = [];

  Blockchain.doeGenesisBlock() { doeNewBlock(25072003, 'derkach'); }

  Block doeLastBlock() => doeChain.last;

  Block doeNewBlock(int doeProof, String doePreviousHash) {
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

  String doeHashBlock(Block block) {
    StringBuffer doeHashBlock = StringBuffer()
      ..write(block.doeIndex)
      ..write(doeProofOfWork(block))
      ..write(block.doePreviousHash)
      ..write(block.doeTimestamp);

    return sha256.convert(utf8.encode(doeHashBlock.toString())).toString();
  }

  int doeProofOfWork(Block block) {
    int doeNewProof = 0;
    while (!isProofValid(block.doeIndex, block.doeProof, doeNewProof, block.doePreviousHash, block.doeTimestamp)) {
      doeNewProof++;
    }

    return doeNewProof;
  }

  bool isProofValid(int doeIndex, int doeLastPOW, int doeProof, String doePreviousHash, int doeTimestamp) =>
      sha256
          .convert(utf8.encode('$doeIndex$doeProof$doePreviousHash$doeTimestamp'))
          .toString()
          .endsWith('07');

  @override
  String toString() => "BLOCKCHAIN: $doeChain";
}
