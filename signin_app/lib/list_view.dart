import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signin_app/list_dates.dart';
import 'package:signin_app/show_data.dart';
import 'package:table_calendar/table_calendar.dart';

class ListDates extends StatelessWidget {
  final List<String> litems = [
    "January",
    "Febuarary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "Septemper",
    "October",
    "November",
    "December"
  ];
  ListDates({Key? key}) : super(key: key);
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
            'Attendance Records',
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Card(
                  child: ListTile(
                    tileColor: Colors.grey.shade100,
                    title: Text(
                      litems[index] + ', 2022',
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
                          MaterialPageRoute(builder: (context) => ListEvent()));
                    },
                  ),
                )));
  }
}
