import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/cubit/bottom_navigator_cubit.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/model/news_response_model.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController controller = RefreshController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
            if (state.isLoading == false) {
              controller.refreshCompleted();
            }
            return SmartRefresher(
              controller: controller,
              onRefresh: () {
                int categoryIndex =
                    context.read<BottomNavigatorCubit>().state.categoryIndex;
                context
                    .read<NewsCubit>()
                    .getAllNews(ModelConstant.listTab[categoryIndex]);
              },
              child: ListView(
                children: [
                  HomePageAppBarWidget(),
                  SizedBox(
                    height: 24,
                  ),
                  TopHeadlineWidget(),
                  SizedBox(
                    height: 24,
                  ),
                  CarouselWidget(),
                  SizedBox(
                    height: 24,
                  ),
                  CategoriesMenuWidget(),
                  SizedBox(
                    height: 24,
                  ),
                  if (state.isLoading)
                    ...List.generate(
                      5,
                      (index) => NewsWidget(
                        articles: Articles(),
                        isLoading: true,
                      ),
                    )
                  else
                    ...state.newsArticleCategory
                        .map(
                          (e) => NewsWidget(
                            articles: e,
                          ),
                        )
                        .toList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
