import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 70.0,
);

const kMessageTextStyle = TextStyle(
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const KtextDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter location',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);
