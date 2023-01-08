import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/article.dart';

import '../../data/model/failure.dart';
import '../../data/repository/news_repository.dart';
import 'breaking_news_state.dart';

class BreakingNewsCubit extends Cubit<BreakingNewsState> {
  final NewsRepository _breakingNewsRepository = NewsRepository();
  BreakingNewsCubit() : super(BreakingNewsInitial()) {
    getBreakingNews();
  }

  Future<void> getBreakingNews() async {
    emit(BreakingNewsLoading());
    try {
      final List<Article> articlesList = await _breakingNewsRepository.getBreakingNews();
      emit(BreakingNewsLoaded(articlesList: articlesList));
    } on Failure catch (error) {
      emit(BreakingNewsError(failure: error));
    } catch (error) {
      emit(BreakingNewsError(
        failure: Failure(
          message: error.toString(),
        ),
      ));
    }
  }
}
