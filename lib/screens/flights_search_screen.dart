import 'package:flutter/material.dart';
import 'package:travel_app/util/images.dart';
import 'package:travel_app/util/strings.dart';
import 'package:travel_app/util/styles.dart';
import 'flight_search_tab.dart';
import '../util/color_constants.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({Key? key}) : super(key: key);

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen>
    with SingleTickerProviderStateMixin {
  String travelers = "1 Passenger";
  String cabinClass = "Economy Class";
  DateTime? selectedDepartureDate;
  DateTime? selectedReturnDate;
  String destination = "Dubai";

  final passengerOptions = ["1 Passenger", "2 Passengers", "3 Passengers"];
  final cabinOptions = ["Economy Class", "Business Class", "First Class"];
  final destinations = ["Dubai", "New York", "London", "Paris"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: ColorConstants.appBarColor,
        title: Text(
          Strings.searchFlights,
          style: metropolisMedium.copyWith(color: ColorConstants.searchFlightsTextColor, fontSize: 18),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.menu),
              color: ColorConstants.searchFlightsTextColor,
              onPressed: () {}),
        ],
        leading: IconButton(
          color: ColorConstants.searchFlightsTextColor,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 1200,
              child: Stack(
                children: [
                  Image.asset(
                    Images.oceanImage,
                  ),
                  Positioned(
                    left: 16.0,
                    top: 16.0,
                    child: Text(
                      Strings.letsStartYour,
                      style: metropolisBold.copyWith(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 110,
                      left: 20,
                      right: 20,
                      child: SizedBox(
                        height: 1200,
                        width: MediaQuery.of(context).size.width,
                        child: DefaultTabController(
                          initialIndex: 1,
                          length: 3,
                          child: Scaffold(
                            backgroundColor: Colors.grey[100],
                            body: Column(
                              children: [
                                Material(
                                  elevation: 3,
                                  child: TabBar(
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.black,
                                    indicator: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.green,
                                    ),
                                    labelStyle: metropolisBold.copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                    tabs: const [
                                      Tab(
                                        text: Strings.roundTrip,
                                      ),
                                      Tab(
                                        text: Strings.oneWay,
                                      ),
                                      Tab(
                                        text: Strings.multiCity,
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  child: TabBarView(
                                    children: [
                                      Center(child: Text("")),
                                      FlightSearchTab(),
                                      Center(child: Text("")),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
