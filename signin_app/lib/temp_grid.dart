// Widget buidGridView() => GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1,
//         mainAxisSpacing: 8,
//         crossAxisSpacing: 4,
//       ),
//       itemCount: numbers.length,
//       itemBuilder: ((context, index) {
//         final item = numbers[index];
//         return buildNumber(item);
//       }),
//     );

// Widget buildNumber(String number) => Container(
//       padding: EdgeInsets.all(16),
//       color: Colors.deepPurpleAccent,
//       child: GridTile(
//         header: Text(
//           'Header $number',
//           textAlign: TextAlign.center,
//         ),
//         child: Center(
//           child: Text(
//             number,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         footer: Text(
//           'Footer $number',
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
