import 'package:blockchain/blockchain.dart';
import 'package:blockchain/transaction.dart';

class Block {
  int index;
  int proof;
  String previousHash;
  String currentHash;
  int timestamp;
  List<Transaction> transactions;

  Block(this.index, this.proof, this.previousHash, this.transactions) 
      : timestamp = DateTime.now().millisecondsSinceEpoch,
      currentHash = Blockchain().hashBlock(index, Blockchain().proofOfWork(index, proof, previousHash), previousHash);

  @override
  String toString() => '\n>[BLOCK INDEX:$index], PREVIOUS HASH: $previousHash, CURRENT HASH: $currentHash, PROOF: $proof, \n TRANSACTIONS: $transactions';
}
