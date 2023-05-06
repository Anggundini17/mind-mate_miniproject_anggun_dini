import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mind_mate_app/view_model/carouselpict_provider.dart';
import 'package:path/path.dart';

import 'carousel.dart';
import 'package:provider/provider.dart';

class CarouselView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pictureData = Provider.of<CarouselPicture>(context);
    final picture = pictureData.pictCarousels;
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
          items: picture
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
        // SizedBox(
        //   height: 30,
        // ),
        // CarouselWithDotsPage(imgList: imgList),
      ],
    );
  }
}
