import 'package:flutter/material.dart';

class MyFadeRoute extends PageRouteBuilder {
  final Widget route;
  MyFadeRoute({required this.route})
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.fastOutSlowIn);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return route;
            });
}
