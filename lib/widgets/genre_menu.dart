import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/model_constant.dart';

class GenreMenu extends StatefulWidget {
  const GenreMenu({Key? key}) : super(key: key);

  @override
  State<GenreMenu> createState() => _GenreMenuState();
}

class _GenreMenuState extends State<GenreMenu> {
 
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            ...List.generate(
              ModelConstant.listTab.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: index == _currentIndex ? Colors.red : Colors.white,
                      border: Border.all(color: Color(0xFFF0F1FA))),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        ModelConstant.listTab[index],
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: index == _currentIndex
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
