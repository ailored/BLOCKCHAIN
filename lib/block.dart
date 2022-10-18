import 'package:blockchain/blockchain.dart';
import 'package:blockchain/transaction.dart';

class Block {
  int doeIndex;
  int doeProof;
  String doePreviousHash;
  String doeCurrentHash;
  int doeTimestamp;
  List<Transaction> doeTransactions;

  Block(this.doeIndex, this.doeProof, this.doePreviousHash, this.doeTransactions) 
      : doeTimestamp = DateTime.now().millisecondsSinceEpoch,
      doeCurrentHash = Blockchain().doeHashBlock(doeIndex, Blockchain().doeProofOfWork(doeIndex, doeProof, doePreviousHash), doePreviousHash);

  @override
  String toString() => '\n>[BLOCK[$doeIndex]] PREVIOUS HASH: $doePreviousHash, CURRENT HASH: $doeCurrentHash, PROOF: $doeProof, \n TRANSACTIONS: $doeTransactions';
}
