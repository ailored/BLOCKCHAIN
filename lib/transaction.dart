class Transaction {
  int index;
  String sender;
  String recipient;
  int amount;

  Transaction(this.index, this.sender, this.recipient, this.amount);

  @override
  String toString() => '\n [$index] FROM: $sender => TO: $recipient == AMOUNT: $amount USD';
}
