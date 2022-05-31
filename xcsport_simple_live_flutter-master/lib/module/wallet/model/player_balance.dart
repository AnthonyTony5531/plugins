
class PlayerBalance{

  String balance = "0.00";
  String creditBalance = "0.00";

  PlayerBalance.from(Map map){
    if(map == null) return;
    this.balance = map['balance']??"0.00";
    if(this.balance != null) {
      this.balance = double.tryParse(this.balance).toStringAsFixed(2);
    }
    this.creditBalance = map['creditBalance'] ?? '0.00';
  }
}