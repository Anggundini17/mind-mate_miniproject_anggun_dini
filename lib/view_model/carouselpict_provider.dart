import 'package:flutter/cupertino.dart';

class CarouselPicture with ChangeNotifier {
  final List<String> _pictCarousels = [
    'https://img.freepik.com/free-vector/group-therapy-illustration-concept_52683-45502.jpg?w=900&t=st=1682660294~exp=1682660894~hmac=0bcd8147b8cb3709cc5cd74d342ae951263e304c73297ae658a870a8198815f6',
    'https://img.freepik.com/free-photo/family-therapy-psychologist-office_23-2149175173.jpg?w=900&t=st=1682659024~exp=1682659624~hmac=87f5eaad420aa76f93f57047ef51b1943cece92c91afdf9584ad39b1405f2104',
    'https://img.freepik.com/free-photo/beautiful-young-women-enjoying-cup-coffee_23-2148431576.jpg?w=900&t=st=1682660761~exp=1682661361~hmac=011ab613ac5d932223cfdd330c82b231f96d2f8c08e585c04b08c2fe08a4e0ac',
  ];

  List<String> get pictCarousels => _pictCarousels;
}
