import 'package:equatable/equatable.dart';

import '../../data/model/article.dart';
import '../../data/model/failure.dart';

abstract class SearchNewsState extends Equatable {
  const SearchNewsState();

  @override
  List<Object> get props => [];
}

class SearchNewsInitial extends SearchNewsState {}

class SearchNewsLoading extends SearchNewsState {}

class SearchNewsLoaded extends SearchNewsState {
  final List<Article> articlesList;

  const SearchNewsLoaded({required this.articlesList});
  @override
  List<Object> get props => [articlesList];
}

class SearchNewsError extends SearchNewsState {
  final Failure failure;

  const SearchNewsError({required this.failure});
  @override
  List<Object> get props => [failure];
}
