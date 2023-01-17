void main() {
  var seatPrice = 0;
  increment() {
    seatPrice++;
    print(seatPrice);
  }

  
  while (seatPrice < 30) {
    increment();
  }
}
