import 'package:flutter/material.dart';

class ReponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ReponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [Image.asset("assets/button_one.jpg")]),
    );
  }
}
