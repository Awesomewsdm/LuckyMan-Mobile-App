// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SeatLayoutModel {
  final int rows;
  final int cols;
  // final List<Map<String, double>> seatTypes;
  final int gap;
  final int gapColIndex;
  final bool isLastFilled;
  final List<int> rowBreaks;
  SeatLayoutModel({
    required this.rows,
    required this.cols,
    // required this.seatTypes,
    required this.gap,
    required this.gapColIndex,
    required this.isLastFilled,
    required this.rowBreaks,
  });

  SeatLayoutModel copyWith({
    int? rows,
    int? cols,
    // List<Map<String, double>>? seatTypes,
    int? gap,
    int? gapColIndex,
    bool? isLastFilled,
    List<int>? rowBreaks,
  }) {
    return SeatLayoutModel(
      rows: rows ?? this.rows,
      cols: cols ?? this.cols,

      gap: gap ?? this.gap,
      gapColIndex: gapColIndex ?? this.gapColIndex,
      isLastFilled: isLastFilled ?? this.isLastFilled, rowBreaks: [],
      // rowBreaks: rowBreaks ?? this.rowBreaks, seatTypes: [],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rows': rows,
      'cols': cols,
      // 'seatTypes': seatTypes,
      'gap': gap,
      'gapColIndex': gapColIndex,
      'isLastFilled': isLastFilled,
      'rowBreaks': rowBreaks,
    };
  }

  factory SeatLayoutModel.fromMap(Map<String, dynamic> map) {
    return SeatLayoutModel(
      rows: map['rows'] as int,
      cols: map['cols'] as int,
      gap: map['gap'] as int,
      gapColIndex: map['gapColIndex'] as int,
      isLastFilled: map['isLastFilled'] as bool,
      rowBreaks: List<int>.from(
        (map['rowBreaks'] as List<int>),
      ),
      // seatTypes: List<Map<String, double>>.from(
      //   (map['seatTypes'] as List<Map<String, double>>),
      // ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SeatLayoutModel.fromJson(String source) =>
      SeatLayoutModel.fromMap(json.decode(source) as Map<String, dynamic>);
//  seatTypes: $seatTypes,
  @override
  String toString() {
    return 'SeatLayoutModel(rows: $rows, cols: $cols, gap: $gap, gapColIndex: $gapColIndex, isLastFilled: $isLastFilled, rowBreaks: $rowBreaks,)';
  }
}
