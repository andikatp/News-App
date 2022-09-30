import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/model_constant.dart';
import 'package:news_app/cubit/bottom_navigator_cubit.dart';
import 'package:news_app/cubit/news_cubit.dart';

class CategoriesMenuWidget extends StatefulWidget {
  const CategoriesMenuWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesMenuWidget> createState() => _CategoriesMenuWidgetState();
}

class _CategoriesMenuWidgetState extends State<CategoriesMenuWidget> {
  @override
  void initState() {
    super.initState();
    _getNewsCategory();
  }

  void _getNewsCategory() {
    int categoryIndex =
        context.read<BottomNavigatorCubit>().state.categoryIndex;
    context.read<NewsCubit>().getAllNews(ModelConstant.listTab[categoryIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            ...List.generate(
              ModelConstant.listTab.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: BlocBuilder<BottomNavigatorCubit, BottomNavigatorState>(
                  builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: index == state.categoryIndex
                              ? Colors.red
                              : Colors.white,
                          border: Border.all(color: Color(0xFFF0F1FA))),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            context
                                .read<BottomNavigatorCubit>()
                                .moveCategory(index);
                            _getNewsCategory();
                          });
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            ModelConstant.listTab[index],
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: index == state.categoryIndex
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
