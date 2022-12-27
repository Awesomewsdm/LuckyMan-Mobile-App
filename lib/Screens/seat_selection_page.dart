import 'package:flutter/material.dart';

import '../Components/dropdown.dart';
import '../Models/utils/form_items.dart';

class SeatSectionPage extends StatefulWidget {
  const SeatSectionPage({Key? key}) : super(key: key);
  static const String id = '/SeatSectionPage';

  @override
  State<SeatSectionPage> createState() => _SeatSectionPageState();
}

class _SeatSectionPageState extends State<SeatSectionPage> {
 
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Enter Your Full Name.',
                  hintStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 30),
               const DropdownMenu(
                items: destinations,
                formLabel: 'Select your destination',
              ),
               const DropdownMenu(
                items: destinations,
                formLabel: 'Select your destination',
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  setState(() {
                    Navigator.pushNamed(context, '/BookASeatScreen');
                  });
                },
                child: const Text('Submit Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class SeatSectionPage extends StatefulWidget {

//   const SeatSectionPage({super.key});

//   @override
//   State<SeatSectionPage> createState() => _SeatSectionPageState();
// }

// class _SeatSectionPageState extends State<SeatSectionPage> {
//   String selectedBusClass = 'ECONOMY';

//   List<DropdownMenuItem<String>> _getDropdownItems() {
//     List<DropdownMenuItem<String>> dropdownItems = [];
//     for (var busClass in busClasses) {
//       var newItem = DropdownMenuItem(
//         value: busClass,
//         child: Text(busClass),
//       );
//       dropdownItems.add(newItem);
//     }
//     return dropdownItems;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScreenTemplate(
//       decoration: kSeatScreenBoxDecoration,
//       onPressed: () {
//         Navigator.pushNamed(
//           context,
//           '/PaymentScreen',
//         );
//       },
//       bottomTextLabel: '',
//       title: '',
//       subTitle: '',
//       child: Column(
//         children: [
//           const AshTextWidget(text: 'Class'),
//           DropdownButton(
//             items: _getDropdownItems(),
//             onChanged: ((value) {
//               setState(() {
//                 selectedBusClass = value!;
//               });
//             }),
//           ),
//         Container(
//           height: 10.0,
//           width: 10.0,
//           decoration: const BoxDecoration(shape: BoxShape.rectangle),
//           child: const Text('1'),
//         )
//         ],
//       ),
//     );
//   }
// }
