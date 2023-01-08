import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/breaking_news/breaking_news_cubit.dart';
import 'package:news_app/cubit/home/home_screen_cubit.dart';
import 'package:news_app/presentation/screens/breaking_news_Screen.dart';
import 'package:news_app/presentation/screens/home_screen.dart';
import 'package:news_app/presentation/screens/search_news_screen.dart';
import 'package:news_app/utils/colors.dart';

import 'cubit/search_news/search_news_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeScreenCubit>(
          create: (BuildContext context) => HomeScreenCubit(),
        ),
        BlocProvider<SearchNewsCubit>(
          create: (BuildContext context) => SearchNewsCubit(),
        ),
        BlocProvider<BreakingNewsCubit>(
          create: (BuildContext context) => BreakingNewsCubit(),
        ),
      ],
      child:MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: primaryColor,primarySwatch: Colors.deepPurple),
        home: const HomeScreen(),
      ),
    );
  }
}
