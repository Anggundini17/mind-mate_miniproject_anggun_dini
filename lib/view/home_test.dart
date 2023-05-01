import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'homepage_component/carousel.dart';

final List<String> imgList = [
  'https://img.freepik.com/free-vector/group-therapy-illustration-concept_52683-45502.jpg?w=900&t=st=1682660294~exp=1682660894~hmac=0bcd8147b8cb3709cc5cd74d342ae951263e304c73297ae658a870a8198815f6',
  'https://img.freepik.com/free-photo/family-therapy-psychologist-office_23-2149175173.jpg?w=900&t=st=1682659024~exp=1682659624~hmac=87f5eaad420aa76f93f57047ef51b1943cece92c91afdf9584ad39b1405f2104',
  'https://img.freepik.com/free-photo/beautiful-young-women-enjoying-cup-coffee_23-2148431576.jpg?w=900&t=st=1682660761~exp=1682661361~hmac=011ab613ac5d932223cfdd330c82b231f96d2f8c08e585c04b08c2fe08a4e0ac',
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(25),
          child: Text(
            "Find Your Support System on MindMate",
            style: TextStyle(
              // color: Colors.green[700],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        CarouselSlider(
          items: imgList
              .map((item) => ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: 500,
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        // CarouselWithDotsPage(imgList: imgList),
      ],
    );
  }
}
