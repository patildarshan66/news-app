import 'package:equatable/equatable.dart';

import '../../data/model/article.dart';
import '../../data/model/failure.dart';

abstract class BreakingNewsState extends Equatable {
  const BreakingNewsState();

  @override
  List<Object> get props => [];
}

class BreakingNewsInitial extends BreakingNewsState {}

class BreakingNewsLoading extends BreakingNewsState {}

class BreakingNewsLoaded extends BreakingNewsState {
  final List<Article> articlesList;

  const BreakingNewsLoaded({required this.articlesList});
  @override
  List<Object> get props => [articlesList];
}

class BreakingNewsError extends BreakingNewsState {
  final Failure failure;

  const BreakingNewsError({required this.failure});
  @override
  List<Object> get props => [failure];
}
