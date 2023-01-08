import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/breaking_news/breaking_news_cubit.dart';
import 'package:news_app/cubit/breaking_news/breaking_news_state.dart';
import '../../common/shimmer_list_loader.dart';
import '../widgets/new_article_list_item.dart';

class BreakingNewsScreen extends StatefulWidget {
  const BreakingNewsScreen({Key? key}) : super(key: key);

  @override
  State<BreakingNewsScreen> createState() => _BreakingNewsScreenState();
}

class _BreakingNewsScreenState extends State<BreakingNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BreakingNewsCubit, BreakingNewsState>(
        builder: (context, state) {
          if (state is BreakingNewsLoading || state is BreakingNewsInitial) {
            return ShimmerListLoader(height: MediaQuery.of(context).size.height * 0.25);
          } else if (state is BreakingNewsError) {
            return Center(
              child: Text(state.failure.message),
            );
          } else if (state is BreakingNewsLoaded) {
            return ListView.builder(
                itemCount: state.articlesList.length,
                itemBuilder: (context, index) {
                  return NewsArticleListItem(data: state.articlesList[index]);
                });
          } else {
            return ShimmerListLoader(height: MediaQuery.of(context).size.height * 0.25);
          }
        },
      ),
    );
  }
}
