import 'package:flutter/material.dart';
import 'package:travel_app/util/styles.dart';

class DateSelectionWidget extends StatefulWidget {
  const DateSelectionWidget({Key? key}) : super(key: key);

  @override
  State<DateSelectionWidget> createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  int selectedIndex = 1;

  final List<DateRange> dateRanges = [
    DateRange(
      startDate: "Mar 22",
      endDate: "Mar 23",
      price: 741,
    ),
    DateRange(
      startDate: "Mar 23",
      endDate: "Mar 24",
      price: 721,
    ),
    DateRange(
      startDate: "Mar 24",
      endDate: "Mar 25",
      price: 750,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          dateRanges.length,
              (index) => Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16.0 : 4.0,
              right: 4.0,
            ),
            child: _buildDateButton(index),
          ),
        ),
      ),
    );

  }

  Widget _buildDateButton(int index) {
    final isSelected = selectedIndex == index;
    final dateRange = dateRanges[index];

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey[300]!,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${dateRange.startDate} - ${dateRange.endDate}",
              style: metropolisMedium.copyWith(fontSize: 12,
                color: isSelected ? Colors.green : Colors.black87,)
            ),
            const SizedBox(height: 4),
            Text(
              "From AED ${dateRange.price}",
              style: metropolisRegular.copyWith(fontSize: 12,
                color: isSelected ? Colors.green : Colors.black87,
              )
            ),
          ],
        ),
      ),
    );
  }
}

class DateRange {
  final String startDate;
  final String endDate;
  final int price;

  DateRange({
    required this.startDate,
    required this.endDate,
    required this.price,
  });
}

