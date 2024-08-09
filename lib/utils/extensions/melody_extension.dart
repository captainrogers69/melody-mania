import 'package:flutter/material.dart';

final List<BoxShadow> eventBoxShadow = [
  const BoxShadow(
    offset: Offset(2, 2),
    blurRadius: 12,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  )
];

final List<BoxShadow> eventTopBoxShadow = [
  const BoxShadow(
    offset: Offset(-12, -12),
    blurRadius: 12,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  )
];

final List<BoxShadow> eventTopBoxWhiteShadow = [
  const BoxShadow(
    offset: Offset(-12, -12),
    blurRadius: 12,
    color: Color.fromRGBO(255, 255, 255, 0.068),
  )
];

final Border stanBorder = Border.all(color: Colors.black, width: 1.5);
final Border stanBlueBorder = Border.all(color: Colors.black, width: 1.5);
final Border smallBorder = Border.all(color: Colors.black);
final Border smallBlueBorder = Border.all(color: Colors.blue);

final BorderRadius eventRadiusSmaller = BorderRadius.circular(5);
final BorderRadius eventRadiusSmall = BorderRadius.circular(8);
final BorderRadius eventRadiusStan = BorderRadius.circular(11);
final BorderRadius eventRadiusMidder = BorderRadius.circular(15);
final BorderRadius eventRadiusMid = BorderRadius.circular(21);
final BorderRadius eventRadiusCircular = BorderRadius.circular(81);

const BorderRadius eventSmallTopShape = BorderRadius.only(
  topLeft: Radius.circular(5),
  topRight: Radius.circular(5),
);

const BorderRadius eventRoundedShape = BorderRadius.only(
  topLeft: Radius.circular(11),
  topRight: Radius.circular(11),
);

const ShapeBorder eventRoundedShapeStan = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(11),
    topRight: Radius.circular(11),
  ),
);

final ShapeBorder eventStandardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(5),
);

final OutlinedBorder eventStandardShapeOutline = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(7),
);

final ShapeBorder eventCircularShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(300),
);

final ShapeBorder eventStandardMidShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(11),
);

final ShapeBorder eventMidShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(11),
);

const ShapeBorder eventRoundedShapeMid = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(21),
    topRight: Radius.circular(21),
  ),
);

const marginSymmetric = EdgeInsets.symmetric(vertical: 7, horizontal: 5);
