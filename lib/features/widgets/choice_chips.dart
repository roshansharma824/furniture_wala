import 'package:flutter/material.dart';

import '../../constants/text_strings.dart';

class ChoiceChipsWidgets extends StatefulWidget {
  const ChoiceChipsWidgets({super.key});

  @override
  State<ChoiceChipsWidgets> createState() => _ChoiceChipsWidgetsState();
}

class _ChoiceChipsWidgetsState extends State<ChoiceChipsWidgets> {
  int? _value = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Wrap(
                spacing: 12,
                children: List.generate(
                  mostPopularCategoriesList.length,
                  (int index) {
                    // choice chip allow us to
                    // set its properties.
                    return RawChip(
                      showCheckmark: false,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      label: Text(
                        mostPopularCategoriesList[index],
                        style: TextStyle(
                            color:
                                _value == index ? Colors.white : Colors.black),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      selectedColor: Colors.black,
                      selected: _value == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? index : null;
                        });
                      },
                    );
                  },
                ).toList(),
              )
            ],
          ),
        ));
  }
}
