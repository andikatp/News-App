import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/news_response_model.dart';
import 'package:news_app/services/news_services.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit()
      : super(NewsState(
            newsArticleCategory: [],
            newsArticleHeadline: [],
            isLoading: false));

  void getAllNews(String category) async {
    emit(state.copyWith(newsArticleCategory: [], newsArticleHeadline: [], isLoading: true));

    await Future.delayed(Duration(seconds: 1));
    final newsArticle = await NewsServices.getNewsCategories(category);
    final newsArticleHeadline = await NewsServices.getNewsHeadline();

    emit(NewsState(
      newsArticleCategory: newsArticle,
      newsArticleHeadline: newsArticleHeadline,
      isLoading: false,
    ));
  }
}

class NewsState {
  final List<Articles> newsArticleCategory;
  final List<Articles> newsArticleHeadline;
  final bool isLoading;

  NewsState(
      {required this.newsArticleCategory,
      required this.newsArticleHeadline,
      required this.isLoading});

  NewsState copyWith({
    List<Articles>? newsArticleCategory,
    List<Articles>? newsArticleHeadline,
    bool? isLoading,
  }) {
    return NewsState(
      newsArticleCategory: newsArticleCategory ?? this.newsArticleCategory,
      newsArticleHeadline: newsArticleHeadline ?? this.newsArticleHeadline,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
