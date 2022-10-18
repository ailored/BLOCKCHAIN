import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:blockchain/block.dart';
import 'package:blockchain/transaction.dart';

class Blockchain {
  List<Block> chain = [];
  List<Transaction> currentTransactions = [];

  Blockchain();
  Blockchain.genesisBlock() { newBlock(proof: 25072003, previousHash: 'derkach'); }

  Block lastBlock() => chain.last;

  Block newBlock({int proof=0, String previousHash=''}) {
    List<Transaction> transactions = currentTransactions.toList();

    Block newBlock = Block(chain.length, proof, previousHash, transactions);

    currentTransactions.clear();
    chain.add(newBlock);

    return newBlock;
  }

  int newTransaction(String sender, String recipient, int amount) {
    currentTransactions.add(Transaction(currentTransactions.length+1, sender, recipient, amount));

    return chain.length;
  }

  String hashBlock(int index, int proof, String previousHash) {
    StringBuffer hashBlock = StringBuffer()
      ..write(index)
      ..write(proof)
      ..write(previousHash);

    return sha256.convert(utf8.encode(hashBlock.toString())).toString();
  }

  int proofOfWork(int index, int lastPOW, String previousHash) {
    int proof = 0;
    while (!isProofValid(index, lastPOW, proof, previousHash)) {
      proof++;
    }

    return proof;
  }

  bool isProofValid(int index, int lastPOW, int proof, String previousHash) =>
      sha256
          .convert(utf8.encode('$index$proof$previousHash'))
          .toString()
          .endsWith('07');

  @override
  String toString() => "BLOCKCHAIN: $chain";
}
