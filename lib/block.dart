import 'package:blockchain/transaction.dart';

class Block {
  int doeIndex;
  int doeProof;
  String doePreviousHash;
  int doeTimestamp;
  List<Transaction> doeTransactions;

  Block(this.doeIndex, this.doeProof, this.doePreviousHash, this.doeTransactions) 
      : doeTimestamp = DateTime.now().millisecondsSinceEpoch;

  @override
  String toString() => '> [BLOCK[$doeIndex]] PREVIOUS HASH: $doePreviousHash, PROOF: $doeProof';
  // String toString() => '> [BLOCK[$doeIndex]] PREVIOUS HASH: $doePreviousHash, PROOF: $doeProof \nTransactions: \n$doeTransactions';
}
