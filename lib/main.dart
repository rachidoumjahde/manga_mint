import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangamint/bloc/bloc.dart';
import 'package:mangamint/bloc/chapter_bloc/bloc.dart';
import 'package:mangamint/bloc/genre_list_bloc/bloc.dart';
import 'package:mangamint/bloc/manga_detail_bloc/bloc.dart';
import 'package:mangamint/bloc/popular_bloc/bloc.dart';
import 'package:mangamint/bloc/recomended_bloc/bloc.dart';
import 'package:mangamint/components/bottom_nav_bar.dart';
import 'package:mangamint/constants/base_color.dart';
import 'package:mangamint/helper/routes.dart';
import 'package:mangamint/repositories/chapter_repo.dart';
import 'package:mangamint/repositories/genre_list_repo.dart';
import 'package:mangamint/repositories/manga_detail_repo.dart';
import 'package:mangamint/repositories/manga_list_repo.dart';
import 'package:mangamint/repositories/popular_repo.dart';
import 'package:mangamint/repositories/recommended_repo.dart';
import 'package:mangamint/screens/home_screens/index_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          BlocProvider<MangaListBloc>(
              create: (context) => MangaListBloc(MangaListRepo())),
          BlocProvider<MangaDetailBloc>(
            create: (context) => MangaDetailBloc(MangaDetailRepo()),
          ),
          BlocProvider<ChapterBlocBloc>(
            create: (context) => ChapterBlocBloc(ChapterRepo()),
          ),
          BlocProvider<RecomendedBloc>(
            create: (_) => RecomendedBloc(RecommendedRepo()),
          ),
          BlocProvider<GenreListBloc>(
            create: (_) => GenreListBloc(GenreListRepo()),
          ),
          BlocProvider<PopularBloc>(
            create: (_) => PopularBloc(PopularRepo()),
          ),
//          ChangeNotifierProvider<RecommendedRepo>(
//            create: (context) => RecommendedRepo(),
//          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            textTheme: TextTheme(
              button: GoogleFonts.roboto(),
              caption: GoogleFonts.roboto()
            ),
            appBarTheme: AppBarTheme(
              actionsIconTheme: IconThemeData(color: BaseColor.black),
              color: Colors.white
            )
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: generateRoute,
        )
    );
  }
}