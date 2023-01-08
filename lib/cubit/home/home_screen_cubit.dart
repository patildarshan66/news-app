import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<int> {
  HomeScreenCubit() : super(0);

  /// update index function to update the index onTap in BottomNavigationBar
  void updateIndex(int index) => emit(index);

  /// for navigation button on single page
  void getBreakingNews() => emit(0);
  void getSearchNews() => emit(1);
}