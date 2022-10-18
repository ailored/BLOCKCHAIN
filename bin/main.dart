import 'dart:math';
import 'package:blockchain/blockchain.dart';

void main(List<String> arguments) {
  print("\n${'=' * 50} BLOCKCHAIN LAB-1 ${'=' * 50}");

  Blockchain doeBlockchain = Blockchain.doeGenesisBlock();

  for (var i = 0; i < 5; i++) {
    for (var i = 0; i < Random().nextInt(10); i++) {
      doeBlockchain.doeNewTransaction(
          doeUsersData[Random().nextInt(doeUsersData.length)],
          doeUsersData[Random().nextInt(doeUsersData.length)],
          Random().nextInt(10000));
    }
    doeBlockchain.doeNewBlock(
        doeProof: doeBlockchain.doeProofOfWork(i, doeBlockchain.doeLastBlock().doeProof, doeBlockchain.doeLastBlock().doeCurrentHash),
        doePreviousHash: doeBlockchain.doeLastBlock().doeCurrentHash);
  }

  print(doeBlockchain);
  print('${'=' * 118}\n');
}

const List<String> doeUsersData = [
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
