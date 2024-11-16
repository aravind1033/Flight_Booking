import 'package:flutter/material.dart';
import 'package:travel_app/screens/search_results_screen.dart';
import 'package:travel_app/util/color_constants.dart';
import 'package:travel_app/util/images.dart';
import 'package:travel_app/util/strings.dart';
import 'package:travel_app/util/styles.dart';

class FlightSearchTab extends StatefulWidget {
  const FlightSearchTab({Key? key}) : super(key: key);

  @override
  State<FlightSearchTab> createState() => _FlightSearchTabState();
}

class _FlightSearchTabState extends State<FlightSearchTab> {
  String travelers = "1 Passenger";
  String cabinClass = "Economy Class";
  DateTime? selectedDepartureDate;
  DateTime? selectedReturnDate;
  String destination = "Dubai";

  final passengerOptions = ["1 Passenger", "2 Passengers", "3 Passengers"];
  final cabinOptions = ["Economy Class", "Business Class", "First Class"];
  final destinationsDrop = ["Dubai", "New York", "London", "Paris"];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Row(
              children: [
                const SizedBox(width: 8.0),
                Image.asset(
                  Images.flightImage,
                  height: 21,
                  width: 20,
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: Strings.from,
                      hintStyle: metropolisRegular.copyWith(fontSize: 16),
                      border: InputBorder.none,
                      isDense: true, // Reduces padding
                      contentPadding: EdgeInsets.zero, // Aligns with design
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                Image.asset(
                  Images.horizondalLine,
                  height: 2,
                  width: 190,
                ),
                Image.asset(
                  Images.reverseIcon,
                  height: 42,
                  width: 42,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 8.0),
                Image.asset(
                  Images.locationIcon,
                  height: 19,
                  width: 14,
                ),
                const SizedBox(width: 18.0),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: Strings.to,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: Strings.departure,
                    labelStyle: TextStyle(
                      backgroundColor:
                          ColorConstants.greenBackground, // Background color for label text
                      color: ColorConstants.labelColor, // Text color for better contrast
                    ),
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    children: [
                       Text(
                        "Sat, 23 Mar - 2024",
                        style: metropolisMedium.copyWith(fontSize: 12.0),
                      ),
                      const Spacer(),
                      Image.asset(
                        Images.calendarIcon,
                        height: 18,
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                onTap: null, // No date selection for "Return" in One Way
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: Strings.returnString,
                    labelStyle: TextStyle(
                      backgroundColor:
                          ColorConstants.labelColorGrey, // Background color for label text
                      color: ColorConstants.labelTextColorGrey, // Text color for better contrast
                    ),
                    border: OutlineInputBorder(),
                    enabled: false,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Sat, 23 Mar - 2024",
                        style: metropolisMedium.copyWith(fontSize: 12.0),
                      ),
                      const Spacer(),
                      Image.asset(
                        Images.calendarIcon,
                        height: 18,
                        width: 20,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: travelers,
                icon: const SizedBox.shrink(),
                decoration: const InputDecoration(
                  labelText: "Travelers",
                  labelStyle: TextStyle(
                    backgroundColor: ColorConstants.greenBackground, // Background color for label text
                    color: ColorConstants.labelColor, // Text color for better contrast
                  ),
                  border: OutlineInputBorder(),
                ),
                items: passengerOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                    style: metropolisMedium.copyWith(fontSize: 12.0),),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    travelers = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: DropdownButtonFormField<String>(
                icon: const SizedBox.shrink(),
                value: cabinClass,
                decoration: const InputDecoration(
                  labelText: "Cabin Class",
                  labelStyle: TextStyle(
                    backgroundColor:
                        ColorConstants.greenBackground, // Background color for label text
                    color: ColorConstants.labelColor, // Text color for better contrast
                  ),
                  border: OutlineInputBorder(),
                ),
                items: cabinOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                      style: metropolisMedium.copyWith(fontSize: 12.0),),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    cabinClass = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 139, // Adjust the width
          height: 40, // Adjust the height
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchResultsScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 8), // Reduced padding
              textStyle: const TextStyle(fontSize: 16), // Adjust font size
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
            child: const Text("Search Flights"),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              "Travel Inspirations",
              style: metropolisBold.copyWith(fontSize: 16),
            ),
            DropdownButton<String>(
              value: destination,
              items: destinationsDrop.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: metropolisMedium.copyWith(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  destination = newValue!;
                });
              },
              icon: Image.asset(
                'assets/image/dropdown_icon.jpg', // Replace with your custom image path
                width: 10,
                height: 10,
              ),
              underline: const SizedBox.shrink(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 250, // Height of the cards
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              final destination = destinations[index];
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0.0 : 16.0),
                child: DestinationCard(destination: destination),
              );
            },
          ),
        ),
        const SizedBox(height: 30),
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Flight & Hotel Packages",
              style: metropolisBold.copyWith(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            "assets/image/flight_hotel_package.png",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Width of each card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          image: AssetImage(destination.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Text overlay
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From ${destination.price}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Economy round trip",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  destination.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Destination {
  final String name;
  final String price;
  final String image;

  Destination({
    required this.name,
    required this.price,
    required this.image,
  });
}

final destinations = [
  Destination(
    name: "Saudi Arabia",
    price: "AED867",
    image: "assets/image/saudi_arabia.png",
  ),
  Destination(
    name: "Kuwait",
    price: "AED867",
    image: "assets/image/kuwait.png",
  ),
];
