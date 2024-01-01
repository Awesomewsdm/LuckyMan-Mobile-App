import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SeatSelectionScreen2 extends StatefulWidget {
  final DocumentSnapshot busSnapshot;

  const SeatSelectionScreen2({super.key, required this.busSnapshot});

  @override
  _SeatSelectionScreen2State createState() => _SeatSelectionScreen2State();
}

class _SeatSelectionScreen2State extends State<SeatSelectionScreen2> {
  List<String> selectedSeats = [];

  int get totalPrice {
    final Map<String, dynamic> bus =
        widget.busSnapshot.data() as Map<String, dynamic>;
    final ticketPrice = bus["ticketPrice"] as int;
    return selectedSeats.length * ticketPrice;
  }

  void toggleSeat(String seatNumber) {
    setState(() {
      if (selectedSeats.contains(seatNumber)) {
        selectedSeats.remove(seatNumber);
      } else {
        selectedSeats.add(seatNumber);
      }
    });
  }

  void bookSeats() async {
    final Map<String, dynamic> bus =
        widget.busSnapshot.data() as Map<String, dynamic>;
    final updatedData = {
      'bookedSeats': [...bus['bookedSeats'] as List<dynamic>, ...selectedSeats]
    };

    await widget.busSnapshot.reference.update(updatedData);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Seats booked successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> bus =
        widget.busSnapshot.data() as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seat Selection'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 5,
              children: List.generate(36, (index) {
                final seatNumber = (index < 16)
                    ? (index + 1).toString()
                    : (index + 10).toString();
                final column = index % 4;

                // Check if the seat is in the middle column except the last seat
                if (column == 1 && index != 35) {
                  return const SizedBox.shrink(); // Skip rendering the seat
                }
                final bookedSeats = bus['bookedSeats'] as List<dynamic>;
                final isBooked = bookedSeats.contains(seatNumber);
                final isSelected = selectedSeats.contains(seatNumber);
                final color = isBooked
                    ? Colors.grey
                    : isSelected
                        ? Colors.blue
                        : Colors.white;

                return GestureDetector(
                  onTap: isBooked ? null : () => toggleSeat(seatNumber),
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    color: color,
                    child: Center(child: Text(seatNumber)),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Selected Seats: ${selectedSeats.length}'),
                Text('Total Price: \$${totalPrice.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: selectedSeats.isEmpty ? null : bookSeats,
        label: const Text('Book Seats'),
        icon: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
