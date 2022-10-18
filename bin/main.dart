import 'dart:math';
import 'package:blockchain/blockchain.dart';

void main(List<String> arguments) {
  print("\n${'=' * 50} BLOCKCHAIN LAB-1 ${'=' * 50}");


  Blockchain blockchain = Blockchain();

  blockchain.newBlock(proof: 25072003, previousHash: 'derkach'); //* genesis block

  for (var i = 0; i < 5; i++) {
    for (var i = 0; i < Random().nextInt(10); i++) {
      blockchain.newTransaction(
          usersData[Random().nextInt(usersData.length)],
          usersData[Random().nextInt(usersData.length)],
          Random().nextInt(10000));
    }
    blockchain.newBlock(
        proof: blockchain.proofOfWork(i, blockchain.lastBlock().proof, blockchain.lastBlock().currentHash),
        previousHash: blockchain.lastBlock().currentHash);
  }
  
  print(blockchain);
  print('${'=' * 118}\n');
}

const List<String> usersData = [
  "Wendi Matthews",
  "Meyers Briggs",
  "Woodard Gross",
  "Aguilar Pollard",
  "Duke Britt",
  "Moran Harper",
  "Tracey Bridges",
  "Miranda Willis",
  "Myra Mcintyre",
  "Beulah Gill",
  "Ruby Castaneda",
  "Olga Hamilton",
  "Bettye Castro",
  "Long Rivas",
  "Adriana Acevedo",
  "Scott Larson",
  "Gabriela Chen",
  "Flowers Berger",
  "Lucy Meadows",
  "Georgia Santiago",
  "Williamson Hicks",
  "Fletcher Mcgee",
  "Marilyn Patrick",
  "French Rosales",
  "Poole Dodson",
  "Verna Ramos",
  "Althea Williams",
  "Clare Trevino",
  "Dina Conner",
  "Mamie Booker",
  "Tran Ellison",
  "Ellen Duran",
  "Ollie Blankenship",
  "Toni Woodward",
  "Marisol Vaughn",
  "Kristen Kerr",
  "Jacobson Franklin",
  "Gonzalez Barr",
  "Newton Wood",
  "Chandra England",
  "Bright Molina",
  "Silva Ellis",
  "Hattie Jacobson",
  "Lydia Bauer",
  "Marisa Petty",
  "Marianne Bowers",
  "Waters Holmes",
  "Sykes Herring",
  "Blevins Pruitt",
  "Calderon Fry"
];
