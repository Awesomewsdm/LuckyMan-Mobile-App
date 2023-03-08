import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const List<String> busType = [
  'VIP',
  'STC',
];

const List<String> destinations = [
  'KNUST',
  'Accra',
  'Tema',
  'Kasoa',
  'Madina',
  'Takoradi',
  'Cape Coast',
  'Sunyani',
  'Koforidua',
];

const List<String> from = [
  'KNUST',
  'Accra',
  'Tema',
  'Kasoa',
  'Madina',
  'Takoradi',
  'Cape Coast',
  'Sunyani',
  'Koforidua',
];

const List<String> pickUpPoints = [
  'Royal Parade Grounds',
  'Ayeduase Gate',
  'New Evandy - New Site',
  'Kotei Benab Filling Station',
  'Gaza',
];

final db = FirebaseFirestore.instance;

getDepatureDate()  {
  var departureDate =
       db.collection("Booking Data").doc('departure-date');
departureDate.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;

      return data;
      // ...
    },
    onError: (e) =>  Text("Error getting document: $e"),
  );
  return departureDate;
}

final List<String> departureDate = [
  'My departure date'
];

const List<String> departureTime = [
  '05:00AM',
  '09:00AM',
  '12:00AM',
];

const List<String> busClasses = [
  'ECONOMY',
  'EXECUTIVE',
];
