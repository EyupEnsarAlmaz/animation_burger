import 'package:flutter/material.dart';
import 'model/data.position.dart';

CheckboxListTile chekbox(
    {required Text title,
    required bool value,
    required bool selected,
    required void Function(bool?)? onChanged}) {
  return CheckboxListTile(
      activeColor: Colors.green,
      checkColor: Colors.white,
      title: title,
      value: value,
      selected: selected,
      onChanged: onChanged);
}

AnimatedOpacity animatedOpacity(
    {required Widget image, required double opacity}) {
  return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 500),
      child: image);
}

AnimatedPositioned animatedPositioned(
    {required double top, required Widget animated}) {
  return AnimatedPositioned(
      top: top,
      left: 100,
      duration: const Duration(milliseconds: 500),
      child: animated);
}

arttir() {
  topp -= 18;
}

azalt() {
  topp += 18;
}
