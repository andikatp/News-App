import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class TopHeadlineWidget extends StatelessWidget {
  const TopHeadlineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Latest News',
            style: GoogleFonts.zillaSlab(
                fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'See All',
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0080FF),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Icon(
                Icons.arrow_right_alt,
                color: Color(0xFF0080FF),
              ),
            ],
          )
        ],
      ),
    );
  }
}
