import 'package:flutter/material.dart';
import 'package:news_app/constants/gradient_container.dart';
import 'package:news_app/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 16, 15, 0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 32.0,
              child: TextField(
                decoration: KTextFieldNice.kInputField.copyWith(
                  hintStyle: GoogleFonts.nunito(
                    textStyle: TextStyle(
                        color: Color(0xFF818181).withOpacity(0.5),
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                  suffixIcon: Image.asset(
                    'assets/searchIcon.png',
                    color: Color(0xFF818181),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 32,
            height: 32,
            decoration: KGradientColor.kGradientButtonColor.copyWith(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset('assets/bellIcon.png'),
          ),
        ],
      ),
    );
  }
}
