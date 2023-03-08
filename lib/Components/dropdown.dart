// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/src/constants/colors.dart';

class BookingDropdownMenu extends StatelessWidget {
  const BookingDropdownMenu({
    Key? key,
    required this.items,
    required this.formLabel,
    this.buttonWidth,
    this.formKey,
    this.onSaved,
    this.onChanged,
    this.validator,
    required this.dropdownTitle,
  }) : super(key: key);

  final List<dynamic> items;
  final String formLabel;
  final double? buttonWidth;
  final Key? formKey;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String dropdownTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AshTextWidget(
            text: '$dropdownTitle :',
            fontWeight: FontWeight.w700,
          ),
          // Text(
          //   dropdownTitle,
          //   style:  TextStyle(fontWeight: FontWeight.w700,  color: Colors.lightBlue.shade50,),
          // ),
          const SizedBox(
            height: 5,
          ),
          DropdownButtonFormField2(
            key: formKey,
            buttonWidth: buttonWidth,
            buttonDecoration: BoxDecoration(
                color: backgroundColor5,
                borderRadius: BorderRadius.circular(10)),
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
            hint: Text(
              formLabel,
              style: const TextStyle(fontSize: 14),
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
            items: items
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
            validator: validator,
            onChanged: onChanged,
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }
}
