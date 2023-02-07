// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SeatSelectionModel {
  final String selectedBusClass;
  final String selectedSeatNo;
  SeatSelectionModel({
    required this.selectedBusClass,
    required this.selectedSeatNo,
  });

  SeatSelectionModel copyWith({
    String? selectedBusClass,
    String? selectedSeatNo,
  }) {
    return SeatSelectionModel(
      selectedBusClass: selectedBusClass ?? this.selectedBusClass,
      selectedSeatNo: selectedSeatNo ?? this.selectedSeatNo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedBusClass': selectedBusClass,
      'selectedSeatNo': selectedSeatNo,
    };
  }

  factory SeatSelectionModel.fromMap(Map<String, dynamic> map) {
    return SeatSelectionModel(
      selectedBusClass: map['selectedBusClass'] as String,
      selectedSeatNo: map['selectedSeatNo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SeatSelectionModel.fromJson(String source) => SeatSelectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SeatSelectionModel(selectedBusClass: $selectedBusClass, selectedSeatNo: $selectedSeatNo)';

  @override
  bool operator ==(covariant SeatSelectionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.selectedBusClass == selectedBusClass &&
      other.selectedSeatNo == selectedSeatNo;
  }

  @override
  int get hashCode => selectedBusClass.hashCode ^ selectedSeatNo.hashCode;
}
