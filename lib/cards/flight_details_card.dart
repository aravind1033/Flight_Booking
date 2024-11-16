import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/util/styles.dart';

class FlightDetailsCard extends StatelessWidget {
  const FlightDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            _buildFlightSection(
              journeyType: "Onward",
              airline: "Garuda Indonesia",
              price: "409",
              departureTime: "14:35",
              departureCode: "BLR",
              departureCity: "Bengaluru",
              arrivalTime: "21:55",
              arrivalCode: "DXB",
              arrivalCity: "Dubai",
              duration: "4h 30m",
              stops: "2 Stops",
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                color: Colors.grey,
                height: 1,
              ),
            ),
            _buildFlightSection(
              journeyType: "Return",
              airline: "Garuda Indonesia",
              price: "359",
              departureTime: "21:55",
              departureCode: "DXB",
              departureCity: "Dubai",
              arrivalTime: "14:35",
              arrivalCode: "BLR",
              arrivalCity: "Bengaluru",
              duration: "4h 30m",
              stops: "",
            ),

            const DottedLine(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: Colors.black,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right:20.0,top: 10.0,bottom: 10.0),
              child: Row(
                children: [
                  _buildTag("Cheapest", Colors.green),
                  const SizedBox(width: 10),
                  _buildTag("Refundable", Colors.blue),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "Flight Details",
                          style: metropolisMedium.copyWith(fontSize: 12,color: const Color(0xFFFA7927)),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFFFA7927),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlightSection({
    required String journeyType,
    required String airline,
    required String price,
    required String departureTime,
    required String departureCode,
    required String departureCity,
    required String arrivalTime,
    required String arrivalCode,
    required String arrivalCity,
    required String duration,
    required String stops,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/image/bird_image.png',
                width: 35,
                height: 35,
              ),
              const SizedBox(width: 10),
              Text(
                "$journeyType - $airline",
                overflow: TextOverflow.ellipsis,
                style: metropolisMedium.copyWith(fontSize: 14),
              ),
              const Spacer(),
              Text("AED $price",
                  overflow: TextOverflow.ellipsis,
                  style: metropolisBold.copyWith(fontSize: 14, color: const Color(0xff2EA446))),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(departureTime, style: metropolisBold.copyWith(fontSize: 22)),
                  Text("$departureCode - $departureCity",
                      style: metropolisRegular.copyWith(fontSize: 12)),
                ],
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 2,
                        color: Colors.grey[300],
                      ),
                      const Icon(
                        Icons.flight,
                        color: Colors.green,
                      ),
                      Container(
                        width: 50,
                        height: 2,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    duration,
                    style: metropolisMedium.copyWith(fontSize: 14)
                  ),
                  const SizedBox(height: 4),
                  Text(
                    stops,
                    style:  metropolisMedium.copyWith(fontSize: 14)
                  ),
                ],
              ),

              // Arrival Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    arrivalTime,
                    style: metropolisBold.copyWith(fontSize: 22)
                  ),
                  Text(
                    "$arrivalCode - $arrivalCity",
                    style:metropolisRegular.copyWith(fontSize: 12)
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: metropolisMedium.copyWith(fontSize: 9,color: color),
      ),
    );
  }
}
