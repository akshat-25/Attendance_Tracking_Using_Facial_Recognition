import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signin_app/show_data.dart';
import 'package:table_calendar/table_calendar.dart';

class ListEvent extends StatelessWidget {
  final List<String> litems = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
  ];
  ListEvent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Select Date',
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: 29,
            itemBuilder: (context, index) => Card(
                  child: ListTile(
                    tileColor: Colors.grey.shade100,
                    title: Text(
                      litems[index],
                      style: GoogleFonts.lato(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    leading: const Icon(
                      Icons.date_range,
                      color: Colors.black,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ShowData()));
                    },
                  ),
                )));
  }
}
