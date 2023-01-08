import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/search_news/search_news_cubit.dart';
import 'package:news_app/utils/debouncer.dart';

import '../../common/shimmer_list_loader.dart';
import '../../cubit/search_news/search_news_state.dart';
import '../../utils/custom_dimensions.dart';
import '../widgets/new_article_list_item.dart';

class SearchNewsScreen extends StatefulWidget {
  const SearchNewsScreen({Key? key}) : super(key: key);

  @override
  State<SearchNewsScreen> createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  final DeBouncer _deBouncer = DeBouncer(milliseconds: 400);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SearchNewsCubit, SearchNewsState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(px_16),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search news here'
                    ),
                    onChanged: (value) {
                      if(value.isEmpty){
                        return;
                      }
                      _deBouncer.run(() {
                        context.read<SearchNewsCubit>().searchNews(value);
                      });
                    },
                  ),
                ),
                Expanded(child: _getBody(state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _getBody(state) {
    if (state is SearchNewsLoading) {
      return ShimmerListLoader(height: MediaQuery.of(context).size.height * 0.25);
    } else if (state is SearchNewsInitial) {
      return const Center(child: Text('Search News'),);
    }else if (state is SearchNewsError) {
      return Center(
        child: Text(state.failure.message),
      );
    } else if (state is SearchNewsLoaded) {
      return ListView.builder(
          itemCount: state.articlesList.length,
          itemBuilder: (context, index) {
            return NewsArticleListItem(data: state.articlesList[index]);
          });
    } else {
      return ShimmerListLoader(height: MediaQuery.of(context).size.height * 0.25);
    }
  }
}
