import 'package:flutter/material.dart';
import 'package:test/model/navigator_model.dart';
import 'package:test/ui/favorite/favorite_page.dart';
import 'package:test/ui/home/home_page.dart';
import 'package:test/ui/public/public_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final listNavigator = [
      NavigatorModel(
          linkGambar: 'assets/Vector.png',
          linkText: 'Home',
          halamanTujuan: HomePage()),
      NavigatorModel(
          linkGambar: 'assets/Vector.png',
          linkText: 'Favorite',
          halamanTujuan: FavoritePage()),
      NavigatorModel(
          linkGambar: 'assets/Vector.png',
          linkText: 'Public',
          halamanTujuan: PublicPage()),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          listNavigator[_currentIndex].halamanTujuan ?? HomePage(),
          Container(
            margin: EdgeInsets.all(40),
            height: 66,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 4,
                ),
                Container(
                  height: 4,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                      listNavigator.length,
                      (index) => InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              listNavigator[index].linkGambar ??
                                  'assets/Vector.png',
                              color:
                                  _currentIndex == index ? null : Colors.grey,
                            ),
                            Text(
                              listNavigator[index].linkText ?? 'Home',
                              style: TextStyle(
                                color:
                                    _currentIndex == index ? null : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
