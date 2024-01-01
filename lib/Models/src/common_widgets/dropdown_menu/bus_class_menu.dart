import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../constants/form_items.dart';
import '../../features/core/controllers/seat_selection_controller.dart';

class BusClassDropDownMenu extends StatelessWidget {
  const BusClassDropDownMenu({
    Key? key,
    required this.size,
    required this.seatSelectionController,
  }) : super(key: key);

  final Size size;
  final SeatSelectionController seatSelectionController;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width - 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: DropdownButtonFormField2(
          decoration: InputDecoration(
            //Add isDense true and zero Padding.
            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
            ),
            //Add more decoration as you want here
            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
          ),
          isExpanded: true,
          hint: const Text(
            'Select Bus Class',
            style: TextStyle(fontSize: 14),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 30,
          buttonHeight: 45,
          buttonPadding: const EdgeInsets.only(left: 10, right: 10),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          items: busClasses
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              )
              .toList(),
          validator: (value) {
            if (value == null) {}
            return null;
          },
          onChanged: (value) {
            //Do something when changing the item if you want.

            // seatSelectionController
            //     .selectedDropdownMenuItem = value!;
            // setState(() {
            //   selectedValue = value!;
            // });
            seatSelectionController.changeBusClass(value!);
          },
          onSaved: (value) {
            // selectedValue = value.toString();
          },
        ));
  }
}
