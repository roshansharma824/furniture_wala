import 'package:flutter/material.dart';

final List<Map<String, ImageIcon>> _categoriesList = [
  {
    'Sofa': const ImageIcon(
      AssetImage('assets/images/sofa.png'),
    )
  },
  {
    'Chair': const ImageIcon(
      AssetImage('assets/images/chair.png'),
    )
  },
  {
    'Table': const ImageIcon(
      AssetImage('assets/images/table.png'),
    )
  },
  {
    'Kitchen': const ImageIcon(
      AssetImage('assets/images/kitchen.png'),
    )
  },
  {
    'Lamp': const ImageIcon(
      AssetImage('assets/images/lamp.png'),
    )
  },
  {
    'Cupboard': const ImageIcon(
      AssetImage('assets/images/cupboard.png'),
    )
  },
  {
    'Vase': const ImageIcon(
      AssetImage('assets/images/vase.png'),
    )
  },
  {
    'Others': const ImageIcon(
      AssetImage('assets/images/more.png'),
    )
  },
];

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this would produce 2 rows.
        crossAxisCount: 4,

        // Generate 100 Widgets that display their index in the List
        children: List.generate(8, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black12.withOpacity(0.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: _categoriesList[index].values.first,
                  ),
                ),
                Text(
                  _categoriesList[index].keys.first,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
