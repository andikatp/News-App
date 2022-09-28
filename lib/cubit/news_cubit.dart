import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/news_response_model.dart';
import 'package:news_app/services/news_services.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsState(newsArticle: []));

  void getNews(String category) async {
    emit(NewsState(newsArticle: await NewsServices.getNews(category)));
  }
}

class NewsState {
  final List<Articles> newsArticle;

  NewsState({required this.newsArticle});
}
