import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/counter_cubit.dart';
import 'package:news_app/services/news_services.dart';

class PublicPage extends StatelessWidget {
  const PublicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return ElevatedButton(
          child: Text(state.counter.toString()),
          onPressed: () {
            NewsServices.getNews();
          },
        );
      },
    ));
  }
}

