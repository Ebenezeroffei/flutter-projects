import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget pad(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget padY(double value) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: value,
        ),
        child: this,
      );

  Widget padX(double value) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: value,
        ),
        child: this,
      );

  Widget padT(double value) => Padding(
        padding: EdgeInsets.only(
          top: value,
        ),
        child: this,
      );

  Widget padB(double value) => Padding(
        padding: EdgeInsets.only(
          bottom: value,
        ),
        child: this,
      );

  Widget padL(double value) => Padding(
        padding: EdgeInsets.only(
          left: value,
        ),
        child: this,
      );

  Widget padR(double value) => Padding(
        padding: EdgeInsets.only(
          right: value,
        ),
        child: this,
      );
}
