import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/src/common_widgets/app_bar/primary_app_bar.dart';
import 'package:luckyman_app/src/common_widgets/booking/ticket_data_widget.dart';
import 'package:luckyman_app/src/common_widgets/bottom_nav/bottom_nav.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/core/controllers/reservation_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/screens/bus_booking_screen.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';

class BusTicketScreen extends StatefulWidget {
  const BusTicketScreen({Key? key}) : super(key: key);
  static const String id = '/BusTicketScreen';

  @override
  State<BusTicketScreen> createState() => _BusTicketScreenState();
}

class _BusTicketScreenState extends State<BusTicketScreen> {
  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  final SeatSelectionController seatSelectionController = Get.put(
    SeatSelectionController(),
  );

  final ReservationController reservationController =
      Get.put(ReservationController());

  late Future<DocumentSnapshot> _fetchTicket;

  bool _isRefreshing = false;

  Future<void> _refreshTicket() async {
    if (!_isRefreshing) {
      setState(() {
        _isRefreshing = true;
      });

      _fetchTicket = reservationController.getUserReservationDetailsFromDB();

      setState(() {
        _isRefreshing = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPullToRefreshDialog();
    });
  }

  void _showPullToRefreshDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: const Text('Pull down to refresh if ticket is not showing.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // final _db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(const BusBookingScreen());

        return false;
      },
      child: Scaffold(
        appBar: PrimaryAppBar(
            title: tReservationDetailsScreenTitle,
            onPressed: () {
              Get.to(() => const Home());
            }).getPrimaryAppBar(),
        body: RefreshIndicator(
          onRefresh: _refreshTicket,
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: FutureBuilder(
                  future:
                      reservationController.getUserReservationDetailsFromDB(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        // UserBookingModel userBookingData = snapshot.data as UserBookingModel;
                        if (snapshot.data["isUserBookingComplete"] == true) {
                          return Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: BlackTextWidget(text: ""),
                              ),
                              Container(
                                decoration: kPrimaryBoxDecoration,
                                child: const TicketWidget(
                                  width: 350,
                                  height: 480,
                                  isCornerRounded: true,
                                  padding: EdgeInsets.all(20),
                                  child: TicketData(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.warning_outlined,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Flexible(
                                        child: Text(
                                          'Take a screenshot and show this ticket to the conductor at the bus terminal',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: Text("Sorry you've not booked any seat yet"),
                          );
                        }
                      } else {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      }
                    } else {
                      return const Center(
                        child: Text("Loading..."),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        bottomSheet: SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BottomButton(
                      onPressed: () async {
                        final pdf = PdfDocument();
                        pdf.pages.add().graphics.drawString(
                            'Hello world!',
                            PdfStandardFont(PdfFontFamily.helvetica, 12,
                                style: PdfFontStyle.bold),
                            bounds: const Rect.fromLTWH(0, 0, 200, 50),
                            brush: PdfBrushes.red,
                            pen: PdfPens.blue,
                            format: PdfStringFormat(
                                alignment: PdfTextAlignment.left));
                        final Directory directory =
                            await getApplicationDocumentsDirectory();
                        // final file = File("${directory!.path}/bus ticket.pdf");

                        //Saves the document.
                        await File("${directory.path}/bus ticket.pdf")
                            .writeAsBytes(await pdf.save());
                        //Dispose the document.
                        pdf.dispose();
                      },
                      bottomTextLabel: 'Download Ticket',
                      height: size.width * 0.15),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BottomButton(
                      onPressed: () {
                        Get.to(() => const Home());
                      },
                      bottomTextLabel: "Go Back Home",
                      height: size.width * 0.15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
