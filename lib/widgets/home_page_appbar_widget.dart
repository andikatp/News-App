import 'package:flutter/material.dart';
import 'package:news_app/constants/gradient_container.dart';
import 'package:news_app/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageAppBarWidget extends StatelessWidget {
  const HomePageAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 16, 15, 0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 32.0,
              child: TextField(
                decoration: KTextFieldNice.kInputField.copyWith(
                  hintStyle: TextStyle(
                      color: const Color(0xFF818181).withOpacity(0.5),
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Image.asset(
                    'assets/searchIcon.png',
                    color: const Color(0xFF818181),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            width: 32,
            height: 32,
            decoration: KGradientContainer.kGradientButtonContainer.copyWith(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset('assets/bellIcon.png'),
          ),
        ],
      ),
    );
  }
}
