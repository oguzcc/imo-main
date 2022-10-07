import 'package:flutter/material.dart';

class PagePadding extends EdgeInsets {
  static const double _value = 12;

  const PagePadding.horizontalSymmetric() : super.symmetric(horizontal: _value);
  const PagePadding.verticalSymmetric() : super.symmetric(vertical: _value);
  const PagePadding.general()
      : super.only(right: _value, left: _value, top: _value, bottom: _value);
  const PagePadding.all() : super.all(_value);
  const PagePadding.onlyLeft() : super.only(left: _value);
  const PagePadding.onlyBottom() : super.only(bottom: _value);
  const PagePadding.onlyTop() : super.only(top: _value);
  const PagePadding.onlyRight() : super.only(right: _value);
}
