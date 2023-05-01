import 'package:flutter/material.dart';

import '../detail_psikolog.dart';

class QuotesCard extends StatelessWidget {
  const QuotesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) => const DetailPsikolog(),
        );
      },
      child: Card(
        borderOnForeground: true,
        // semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(left: 25.0, right: 25.0),
        // shadowColor: Colors.blueGrey,
        color: Color.fromRGBO(180, 235, 237, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                '" Inspiration "',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              child: Text(
                "What mental health needs is more sunlight, more candor, and more unashamed conversation.",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "- Glenn Close -",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  // fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
