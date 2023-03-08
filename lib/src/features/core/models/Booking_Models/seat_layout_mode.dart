// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SeatLayoutModel {
  final int rows;
  final int cols;
  List<Map<String, dynamic>> seatTypes;
  final int gap;
  final int gapColIndex;
  final bool isLastFilled;
  final List<int> rowBreaks;
  SeatLayoutModel({
    required this.rows,
    required this.cols,
    required this.seatTypes,
    required this.gap,
    required this.gapColIndex,
    required this.isLastFilled,
    required this.rowBreaks,
  });

  SeatLayoutModel copyWith({
    int? rows,
    int? cols,
    List<Map<String, dynamic>>? seatTypes,
    int? gap,
    int? gapColIndex,
    bool? isLastFilled,
    List<int>? rowBreaks,
  }) {
    return SeatLayoutModel(
      rows: rows ?? this.rows,
      cols: cols ?? this.cols,
      seatTypes: seatTypes ?? this.seatTypes,
      gap: gap ?? this.gap,
      gapColIndex: gapColIndex ?? this.gapColIndex,
      isLastFilled: isLastFilled ?? this.isLastFilled,
      rowBreaks: rowBreaks ?? this.rowBreaks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rows': rows,
      'cols': cols,
      'seatTypes': seatTypes,
      'gap': gap,
      'gapColIndex': gapColIndex,
      'isLastFilled': isLastFilled,
      'rowBreaks': rowBreaks,
    };
  }

  toJson() {
    return {
      'rows': rows,
      'cols': cols,
      'seatTypes': seatTypes,
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
      seatTypes: map['seatTypes'] as List<Map<String, dynamic>>,
      gap: map['gap'] as int,
      gapColIndex: map['gapColIndex'] as int,
      isLastFilled: map['isLastFilled'] as bool,
      rowBreaks: List<int>.from(
        (map['rowBreaks'] as List<int>),
      ),
    );
  }

  factory SeatLayoutModel.fromJson(String source) =>
      SeatLayoutModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SeatLayoutModel(rows: $rows, cols: $cols, seatTypes: $seatTypes, gap: $gap, gapColIndex: $gapColIndex, isLastFilled: $isLastFilled, rowBreaks: $rowBreaks)';
  }

  @override
  bool operator ==(covariant SeatLayoutModel other) {
    if (identical(this, other)) return true;

    return other.rows == rows &&
        other.cols == cols &&
        other.seatTypes == seatTypes &&
        other.gap == gap &&
        other.gapColIndex == gapColIndex &&
        other.isLastFilled == isLastFilled &&
        listEquals(other.rowBreaks, rowBreaks);
  }

  @override
  int get hashCode {
    return rows.hashCode ^
        cols.hashCode ^
        seatTypes.hashCode ^
        gap.hashCode ^
        gapColIndex.hashCode ^
        isLastFilled.hashCode ^
        rowBreaks.hashCode;
  }
}
