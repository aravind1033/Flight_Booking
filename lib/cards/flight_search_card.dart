import 'package:flutter/material.dart';
import 'package:travel_app/util/styles.dart';

class FlightSearchCard extends StatelessWidget {
  final String originCode;
  final String originCity;
  final String destinationCode;
  final String destinationCity;
  final DateTime departureDate;
  final DateTime returnDate;

  const FlightSearchCard({
    Key? key,
    required this.originCode,
    required this.originCity,
    required this.destinationCode,
    required this.destinationCity,
    required this.departureDate,
    required this.returnDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$originCode - $originCity to $destinationCode - $destinationCity',
                    style: metropolisBold.copyWith(
                      fontSize: 14,
                    )),
              ],
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Departure: Sat, 23 Mar - Return: Sat, 23 Mar',
                    style: metropolisMedium.copyWith(fontSize: 12)),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('(Round Trip)', style: metropolisMedium.copyWith(fontSize: 14,color: Color(0xffFA7927))),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    // Handle modify search
                  },
                  child: Text(
                    'Modify Search',
                    style: metropolisMedium.copyWith(fontSize: 12, color: const Color(0xFF2EA446)),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Color(0xffC8C8C8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Sort ", style: metropolisMedium.copyWith(fontSize: 14)),
                    Image.asset(
                      "assets/image/drop_arrow.png",
                      height: 6,
                      width: 10,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Non - Stop", style: metropolisMedium.copyWith(fontSize: 14)),
                  ],
                ),
                Row(
                  children: [
                    Text("Filter ", style: metropolisMedium.copyWith(fontSize: 14)),
                    Image.asset(
                      "assets/image/filter.png",
                      height: 17,
                      width: 17,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



}
