import 'package:flutter/material.dart';
import 'package:mind_mate_app/view/psikolog/psikolog_page.dart';
import 'package:mind_mate_app/view/schedule_history.dart';

import '../../psikolog/detail_psikolog.dart';

import '../animation.dart';

class QuotesCard extends StatelessWidget {
  const QuotesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showModalBottomSheet(
        //   context: context,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(
        //       top: Radius.circular(20),
        //     ),
        //   ),
        //   builder: (context) => const PsikologPage(),
        // );
        Navigator.of(context).push(
          MyFadeRoute(
            route: const HistoryPage(
                // title: 'Consultation Form',
                // getPsikolog: psikologDataId,
                ),
          ),
        );
      },
      child: Card(
        borderOnForeground: true,
        // semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
        // shadowColor: Colors.blueGrey,
        color: const Color.fromRGBO(180, 235, 237, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.calendar_month,
                    color: Color.fromRGBO(35, 75, 86, 1),
                    size: 70,
                  ),
                  Text(
                    'UPCOMING SESSION',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(35, 75, 86, 1)),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 15.0),
            //   child: Text(
            //     '" Inspiration "',
            //     style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
            //   child: Text(
            //     "What mental health needs is more sunlight, more candor, and more unashamed conversation.",
            //     style: TextStyle(
            //       fontSize: 18,
            //       // fontWeight: FontWeight.w500,
            //     ),
            //     textAlign: TextAlign.justify,
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.all(15.0),
            //   child: Text(
            //     "- Glenn Close -",
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w500,
            //       // fontStyle: FontStyle.italic,
            //     ),
            //     textAlign: TextAlign.end,
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
