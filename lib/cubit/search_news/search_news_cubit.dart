import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/search_news/search_news_state.dart';
import 'package:news_app/data/model/article.dart';

import '../../data/model/failure.dart';
import '../../data/repository/news_repository.dart';

class SearchNewsCubit extends Cubit<SearchNewsState> {
  final NewsRepository _breakingNewsRepository = NewsRepository();
  SearchNewsCubit() : super(SearchNewsInitial());

  Future<void> searchNews(String query) async {
    emit(SearchNewsLoading());
    try {
      final List<Article> articlesList = await _breakingNewsRepository.searchNews(query);
      emit(SearchNewsLoaded(articlesList: articlesList));
    } on Failure catch (error) {
      emit(SearchNewsError(failure: error));
    } catch (error) {
      emit(SearchNewsError(
        failure: Failure(
          message: error.toString(),
        ),
      ));
    }
  }
}
