import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  List<List<dynamic>> _data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/attendence.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    const isSelected = true;
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Attendance List',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
              icon: Icon(Icons.search)),
        ],
      ),

      // Display the contents from the CSV file
      body: Column(
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            margin: EdgeInsets.only(left: 3, right: 3),
            padding: EdgeInsets.all(6),
            color: Colors.amber,
            child: Row(
              children: [
                SizedBox(width: 8),
                Text(
                  'Roll No.',
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 70),
                Text(
                  'Name',
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 65),
                Text(
                  'Marked',
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (_, index) {
                return Card(
                  margin: const EdgeInsets.all(3),
                  // color: index == 0 ? Colors.amber : Colors.amber,
                  child: Ink(
                    color: _data[index][2].toString() == 'P'
                        ? Colors.green.shade200
                        : Colors.red.shade300,
                    child: ListTile(
                      // tileColor: index == 0 ? Colors.amber : Colors.orange,
                      leading: Text(
                        _data[index][0].toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.acme(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                        ),
                      ),

                      title: Text(
                        _data[index][1],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.acme(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      trailing: Text(
                        _data[index][2].toString(),
                        style: GoogleFonts.acme(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: _loadCSV),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w200,
          ),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [];
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final sugesstion = suggestions[index];

          return ListTile(
            title: Text(sugesstion),
            onTap: () {
              query = sugesstion;
            },
          );
        });
  }
}
