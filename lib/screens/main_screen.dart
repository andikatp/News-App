import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/cubit/bottom_navigator_cubit.dart';
import 'screens.dart';
import 'package:news_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BlocBuilder<BottomNavigatorCubit, BottomNavigatorState>(
            builder: (context, state) {
              return ModelConstant
                      .listNavigator[state.pageNumber].destinationPage ??
                  HomePage();
            },
          ),
          BottomNavBarWidget(),
        ],
      ),
    );
  }
}
