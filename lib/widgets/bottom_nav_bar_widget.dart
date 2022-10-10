import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/cubit/bottom_navigator_cubit.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      height: 66,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8C8C8C).withOpacity(0.15),
            blurRadius: 2,
            offset: const Offset(-2.4, 4.0), // shadow direction: bottom right
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Container(
            height: 4,
            width: 32,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(8)),
          ),
          const SizedBox(
            height: 8,
          ),
          BlocBuilder<BottomNavigatorCubit, BottomNavigatorState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    ModelConstant.listNavigator.length,
                    (index) {
                      final isActive = state.pageNumber == index;
                      return GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   _currentIndex = index;
                          // });
                          context.read<BottomNavigatorCubit>().movePage(index);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ModelConstant.listNavigator[index].pictureLink ??
                                  'assets/homeIcon.png',
                              color: isActive ? Colors.red : Colors.grey,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              ModelConstant.listNavigator[index].textLink ??
                                  'Home',
                              style: TextStyle(
                                color: isActive ? Colors.red : Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
