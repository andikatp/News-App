import 'package:flutter/material.dart';
import 'package:news_app/model/news_response_model.dart';
import 'package:news_app/services/news_services.dart';

class TesDoang extends StatefulWidget {
  const TesDoang({super.key});

  @override
  State<TesDoang> createState() => _TesDoangState();
}

class _TesDoangState extends State<TesDoang> {
  List<Articles> listArticle = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    setState(
      () async {
        listArticle = await NewsServices.getNewsCategories('health');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: [
          ...listArticle
              .map((e) => Text(
                    e.author ?? 'tidak ada penulis',
                    textAlign: TextAlign.center,
                  ))
              .toList()
        ],
      )),
    );
  }
}
