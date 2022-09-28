import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigatorCubit extends Cubit<BottomNavigatorState> {
  BottomNavigatorCubit() : super(BottomNavigatorState(pageNumber: 0));

  void movePage(int page) {
    emit(BottomNavigatorState(pageNumber: page));
  }
}

class BottomNavigatorState {
  final int pageNumber;

  BottomNavigatorState({required this.pageNumber});
}
