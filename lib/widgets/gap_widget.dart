import 'package:flutter/material.dart';

////////////// create & use space
class GapWidget extends StatelessWidget {
  const GapWidget({super.key, this.width = 0.0, this.height = 0.0});
  final double height; ///// default value is 0
  final double width;
  @override
  Widget build(BuildContext context) {
    ////////// is return only sized box
    ///////// use only space
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
    );
  }
}
