import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/breaking_news/breaking_news_cubit.dart';
import 'package:news_app/cubit/home/home_screen_cubit.dart';
import 'package:news_app/presentation/screens/breaking_news_Screen.dart';
import 'package:news_app/presentation/screens/search_news_screen.dart';
import 'package:news_app/utils/custom_text_styles.dart';

import '../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
          ),
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(),
        );
      },
    );
  }

  final _pageNavigation = [
    BlocProvider(
      create: (context) => BreakingNewsCubit(), //..fetchTopCategory(),
      child: const BreakingNewsScreen(),
    ),
    const SearchNewsScreen(),
  ];

  Widget _buildBody(int index) {
    return _pageNavigation.elementAt(index);
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: context.read<HomeScreenCubit>().state,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: subTitle2_14ptMedium(),
      unselectedLabelStyle: subTitle2_14ptRegular(),
      selectedItemColor: primaryColor,
      unselectedItemColor: greyBlackColor,
      onTap: _getChangeBottomNav,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.announcement_rounded), label: 'Breaking News'),
        BottomNavigationBarItem(
            icon: Icon(Icons.reorder_rounded), label: 'Search News'),
      ],
    );
  }

  void _getChangeBottomNav(int index) {
    context.read<HomeScreenCubit>().updateIndex(index);
  }
}
