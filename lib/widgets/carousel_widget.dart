import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240,
        enlargeCenterPage: true,
        initialPage: 1,
        aspectRatio: 2,
        enableInfiniteScroll: true,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/people.jpg',
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
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        Text(
                          'Crypto investors should be prepared to lose all their money, BOE governor says',
                          style: GoogleFonts.dmSerifDisplay(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          '“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”',
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
