import 'package:flutter/material.dart';
import 'package:test/ui/constant/textstyle.dart';
import 'package:test/ui/home/view/linear_gradient_widget.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Image.asset(
              'assets/gambar1.jpeg',
              height: 128,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            LinearGradientWidget(),
            Positioned.fill(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "5 things to know about the 'conundrum' of lupus",
                      style: KTextStyle.footer.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Matt Villano',
                          style: KTextStyle.footer,
                        ),
                        Text(
                          'Sunday, 9 May 2021',
                          style: KTextStyle.footer,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
