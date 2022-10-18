class Transaction {
  String sender;
  String recipient;
  int amount;

  Transaction(this.sender, this.recipient, this.amount);

  @override
  String toString() => '\n FROM: $sender => TO: $recipient == AMOUNT: $amount USD';
}
