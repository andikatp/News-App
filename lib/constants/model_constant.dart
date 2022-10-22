import 'package:news_app/model/models.dart';
import 'package:news_app/screens/screens.dart';

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
