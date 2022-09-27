import 'package:flutter/material.dart';
import 'package:test/ui/constant/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test/ui/constant/textstyle.dart';
import 'package:test/ui/home/view/linear_gradient_widget.dart';
import 'package:test/ui/home/view/news_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final listTab = ['Healthy', 'Technology', 'Finance', 'Arts', 'Sports'];

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(children: [
                Expanded(
                  child: SizedBox(
                    height: 32.0,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        hintText: 'Dogecoin to the Moon...',
                        hintStyle: TextStyle(fontSize: 12.0),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Image.asset('assets/notif.png')
              ]),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Text(
                    'Latest News',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          color: KColor.blue,
                        ),
                      ),
                      SizedBox(
                        width: 28,
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: KColor.blue,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                height: 240.0,
                viewportFraction: 0.95,
                enableInfiniteScroll: false,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/gambar1.jpeg',
                          height: 240,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        LinearGradientWidget(),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'by Ryan Browne',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                'Crypto investors should be prepared to lose all their money, BOE governor says',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              SizedBox(height: 24),
                              Text(
                                '“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 24,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    listTab.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(16),
                        color: index == _currentIndex
                            ? KColor.redButton
                            : Colors.white,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              listTab[index],
                              style: TextStyle(
                                  color: index == _currentIndex
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ...[
              1,
              1,
              1,
              1,
              1,
              1,
            ].map(
              (e) => NewsWidget(),
            )
          ],
        ),
      ),
    );
  }
}
