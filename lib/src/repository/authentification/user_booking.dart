class UserBooking {
  final int selectedSeats;
  final String selectedbusClass;

  UserBooking(this.selectedSeats, this.selectedbusClass);

  final economySeatPrice = {
    'Accra': 100,
    'Tema': 110,
    'Kasoa': 100,
    'Cape Coast': 90,
    'Koforidua': 80,
    'Sunyani': 100,
   
  };
   final executiveSeatPrice = {
    'Accra': 120,
    'Tema': 130,
    'Kasoa': 120,
    'Cape Coast': 100,
    'Koforidua': 100,
    'Sunyani': 110,

  };

  

  void calcPrice() {
    // var seatPrice = selectedSeats * executiveSeatPrice.values ;
  }
}
