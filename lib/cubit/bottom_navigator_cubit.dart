import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigatorCubit extends Cubit<BottomNavigatorState> {
  BottomNavigatorCubit()
      : super(BottomNavigatorState(pageNumber: 0, categoryIndex: 0));

  void movePage(int page) {
    emit(BottomNavigatorState(
        pageNumber: page, categoryIndex: state.categoryIndex));
  }

  void moveCategory(int index) {
    emit(BottomNavigatorState(
        pageNumber: state.pageNumber, categoryIndex: index));
  }
}

class BottomNavigatorState {
  final int pageNumber;
  final int categoryIndex;
  BottomNavigatorState({required this.pageNumber, required this.categoryIndex});
}
