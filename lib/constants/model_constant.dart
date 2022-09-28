import 'package:news_app/model/models.dart';
import 'package:news_app/screens/screens.dart';

class ModelConstant {
  ModelConstant._();
  static final listNavigator = [
    NavigatorModel(
        linkGambar: 'assets/homeIcon.png',
        linkText: 'Home',
        halamanTujuan: HomePage()),
    NavigatorModel(
        linkGambar: 'assets/favoriteIcon.png',
        linkText: 'Favorite',
        halamanTujuan: FavoritePage()),
    NavigatorModel(
        linkGambar: 'assets/publicIcon.png',
        linkText: 'Public',
        halamanTujuan: PublicPage()),
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
