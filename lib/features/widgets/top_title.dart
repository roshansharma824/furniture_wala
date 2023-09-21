import 'package:flutter/material.dart';

Widget getTopTitle(String left, String right) {
  return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(right),
        ],
      ));
}
