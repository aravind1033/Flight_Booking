import 'package:flutter/material.dart';
import 'package:travel_app/widgets/date_selection_widget.dart';
import 'package:travel_app/cards/flight_search_card.dart';
import 'package:travel_app/util/color_constants.dart';
import 'package:travel_app/util/strings.dart';
import 'package:travel_app/util/styles.dart';

import '../cards/flight_details_card.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.appBarColor,
          title: Text(
            Strings.ezyTravel,
            style: metropolisMedium.copyWith(color: ColorConstants.searchFlightsTextColor,
            fontSize: 18),
          ),
          leading: IconButton(
            color: ColorConstants.searchFlightsTextColor,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            FlightSearchCard(
              originCode: 'BLR',
              originCity: 'Bengaluru',
              destinationCode: 'DXB',
              destinationCity: 'Dubai',
              departureDate: DateTime(2024, 3, 23),
              returnDate: DateTime(2024, 3, 23),
            ),
            const SizedBox(
              height: 10,
            ),
            const DateSelectionWidget(),
            const SizedBox(
              height: 20,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "851 Flight Found",
                  style: metropolisMedium.copyWith(fontSize: 15)
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const FlightDetailsCard(),
            const SizedBox(height: 10,),
            const FlightDetailsCard(),
            const SizedBox(height: 10,),
            const FlightDetailsCard(),
          ],
        )));
  }
}
