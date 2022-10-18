class Transaction {
  int doeIndex;
  String doeSender;
  String doeRecipient;
  int doeAmount;

  Transaction(this.doeIndex, this.doeSender, this.doeRecipient, this.doeAmount);

  @override
  String toString() => '\n [$doeIndex] FROM: $doeSender => TO: $doeRecipient == AMOUNT: $doeAmount USD';
}
