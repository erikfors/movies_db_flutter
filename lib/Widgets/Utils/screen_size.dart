import 'package:flutter/cupertino.dart';

class ScreenSize{
static double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
}
