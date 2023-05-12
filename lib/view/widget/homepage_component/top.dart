import 'package:flutter/material.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(180, 235, 237, 1),
          // color: Colors.blueAccent[400],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: 25.0,
                    top: 25.0,
                  ),
                  child: Text(
                    'Hi, Sunshine!',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(35, 75, 86, 1)),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 5.0),
                child: Text(
                  'How are you today?',
                  style: TextStyle(
                      color: Color.fromRGBO(35, 75, 86, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 5.0),
                child: SizedBox(
                  // height: 110,
                  width: 260,
                  child: Text(
                    'Hope your day is always shining like the sun',
                    style: TextStyle(
                      color: Color.fromRGBO(35, 75, 86, 1),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 25.0, top: 25.0),
            // child: Icon(
            //   Icons.notifications,
            //   size: 25,
            // ),
            child: CircleAvatar(
              radius: 40,
              // backgroundImage: NetworkImage(
              //     'https://f.ptcdn.info/298/073/000/qs7t6ibhscUkbPBmH8t-o.jpg'),
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          )
        ],
      ),
    );
  }
}
