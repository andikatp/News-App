import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return CarouselSlider(
          options: CarouselOptions(
            disableCenter: false,
            padEnds: false,
            height: 240,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            enableInfiniteScroll: false,
          ),
          items: state.newsArticleHeadline.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Image.network(
                          i.urlToImage ?? '',
                          height: 240,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                                color: Colors.yellow,
                                height: 240,
                                width: double.infinity,
                                child: Center(child: Text(error.toString())));
                          },
                        ),
                        LinearGradientWidget(),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                i.author ?? 'Tidak Ada Penulis',
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Text(
                                i.title ?? 'Tidak Ada Judul',
                                style: GoogleFonts.dmSerifDisplay(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(height: 24),
                              Text(
                                i.description ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
