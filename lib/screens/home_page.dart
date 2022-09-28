import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    final angka = [1, 2, 3, 4, 5];
    final gabunganAngka = [7, 8, 8, 8, 8, ...angka];
    print(gabunganAngka[6]);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return ListView(
              children: [
                HomePageAppBar(),
                SizedBox(
                  height: 24,
                ),
                TopHeadline(),
                SizedBox(
                  height: 24,
                ),
                Carousel(),
                SizedBox(
                  height: 24,
                ),
                GenreMenu(),
                SizedBox(
                  height: 24,
                ),
                ...state.newsArticle
                    .map(
                      (e) => NewsWidget(articles: e,),
                    )
                    .toList(),
              ],
            );
          },
        ),
      ),
    );
  }
}
