import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/cubit/bottom_navigator_cubit.dart';
import 'package:news_app/cubit/counter_cubit.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp()
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(), // Wrap your app
      // ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme,
          ),
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
          child: const MainScreenStack(),
        ));
  }
}
