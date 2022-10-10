import 'package:news_app/model/models.dart';
import 'package:news_app/screens/screens.dart';
import 'package:news_app/screens/tes_doang.dart';

class ModelConstant {
  ModelConstant._();
  static final listNavigator = [
    NavigatorModel(
        pictureLink: 'assets/homeIcon.png',
        textLink: 'Home',
        destinationPage: const HomeScreen()),
    NavigatorModel(
        pictureLink: 'assets/favoriteIcon.png',
        textLink: 'Favorite',
        destinationPage: FavoritePage()),
    NavigatorModel(
        pictureLink: 'assets/publicIcon.png',
        textLink: 'Public',
        destinationPage: const PublicPage()),
    NavigatorModel(
        pictureLink: 'assets/publicIcon.png',
        textLink: 'Tes',
        destinationPage: const TesDoang()),
  ];
  static final listTab = [
    'Health',
    'Technology',
    'Business',
    'Entertainment',
    'General',
    'Science',
    'Sports'
  ];
}
