import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/cubit/bottom_navigator_cubit.dart';
import 'package:news_app/cubit/counter_cubit.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // fontFamily: GoogleFonts.nunito().fontFamily
            ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<CounterCubit>(
              create: (BuildContext context) => CounterCubit(),
            ),
            BlocProvider<BottomNavigatorCubit>(
              create: (BuildContext context) => BottomNavigatorCubit(),
            ),
            BlocProvider<NewsCubit>(
              create: (BuildContext context) => NewsCubit(),
            ),
          ],
          child: HomeScreen(),
        ));
  }
}
