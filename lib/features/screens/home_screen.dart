import 'package:flutter/material.dart';

import '../../constants/text_strings.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/categories_view.dart';
import '../widgets/choice_chips.dart';
import '../widgets/search_bar.dart';
import '../widgets/top_title.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              const SearchBarWidget(),
              const SizedBox(
                height: 16,
              ),
              getTopTitle(tSpecialOffers, tSeeAll),
              const SizedBox(
                height: 16,
              ),
              const CarouselSliderWidget(),
              const SizedBox(
                height: 16,
              ),
              const CategoriesWidget(),
              getTopTitle(tMostPopular, tSeeAll),
              const ChoiceChipsWidgets(),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(tabsList[0].keys.first,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              selected: _selectedIndex == 0,
              selectedColor: Colors.black,
              textColor: Colors.black12.withOpacity(0.5),
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(tabsList[1].keys.first,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              selected: _selectedIndex == 1,
              selectedColor: Colors.black,
              textColor: Colors.black12.withOpacity(0.5),
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(tabsList[2].keys.first,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              selected: _selectedIndex == 2,
              selectedColor: Colors.black,
              textColor: Colors.black12.withOpacity(0.5),
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(tabsList[3].keys.first,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              selected: _selectedIndex == 3,
              selectedColor: Colors.black,
              textColor: Colors.black12.withOpacity(0.5),
              onTap: () {
                // Update the state of the app
                _onItemTapped(3);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 24,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: tabsList[0].keys.first,
          ),
          BottomNavigationBarItem(
            icon: tabsList[1].values.last,
            label: tabsList[1].keys.first,
          ),
          BottomNavigationBarItem(
            icon: tabsList[2].values.last,
            label: tabsList[2].keys.first,
          ),
          BottomNavigationBarItem(
            icon: tabsList[3].values.last,
            label: tabsList[3].keys.first,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black12.withOpacity(0.3),
        onTap: _onItemTapped,
      ),
    );
  }
}
