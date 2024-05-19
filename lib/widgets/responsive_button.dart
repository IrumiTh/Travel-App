import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class ReponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ReponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          isResponsive == true
              ? AppText(
                  text: "Book Trip Now",
                  color: Colors.black,
                )
              : Container(),
          Image.asset("assets/button_one.jpg")
        ]),
      ),
    );
  }
}
