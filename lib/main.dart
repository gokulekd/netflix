import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Presentaion/MainPage/sreen_Main_page.dart';
import 'package:tmdb_api/tmdb_api.dart';




List Trending_Now = [];
List Top_10_TV_shows = [];
List South_Indian_Cinimas = [];
List Tensed_dramas = [];
List Released_in_the_Past_year = [];
List Get_videos_data_base = [];
final String apikey = "832f94fbd50d1199b97ddc0919a36e4a";
final Api_Read_access_token =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MzJmOTRmYmQ1MGQxMTk5Yjk3ZGRjMDkxOWEzNmU0YSIsInN1YiI6IjYyOTA1Njc0Mzc4MDYyMDA1MGU1NjA1NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PCImewMOWOQorRi3le_TH27U_pVFl5KTp-TEi1bjkPI";
void main()async {


 
  runApp(const MyApp());
}
movieload_pro()async{
   final tmdbWithCustomLogs = TMDB(
    ApiKeys(apikey, Api_Read_access_token),
    logConfig: const ConfigLogger(
      //must be true than only all other logs will be shown
      showLogs: true,
      showErrorLogs: true,
    ),
  );

   Map South_IndianCinimas = await tmdbWithCustomLogs.v3.movies.getUpcoming();
   print(South_IndianCinimas);
  return South_IndianCinimas['results'];
   

}



movieload() async {
 final tmdbWithCustomLogs = TMDB(
    ApiKeys(apikey, Api_Read_access_token),
    logConfig: const ConfigLogger(
      //must be true than only all other logs will be shown
      showLogs: true,
      showErrorLogs: true,
    ),
  );
  Map TrendingNow = await tmdbWithCustomLogs.v3.trending.getTrending();
   Map Top_10_TVshows = await tmdbWithCustomLogs.v3.tv.getTopRated(); 
   Map South_IndianCinimas = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map TenseDramas = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
     Map  Released_in_the_Pastyear = await tmdbWithCustomLogs.v3.movies.getPopular();
       Map  Get_videos = await tmdbWithCustomLogs.v3.movies.getPopular();

 Trending_Now = TrendingNow['results'];
  Top_10_TV_shows = Top_10_TVshows['results'];
 South_Indian_Cinimas = South_IndianCinimas['results'];
 Tensed_dramas   = TenseDramas['results'];
  Released_in_the_Past_year  = Released_in_the_Pastyear['results'];
Get_videos_data_base = Get_videos['results'];

  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
        scaffoldBackgroundColor: Colors.black,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ScreenMainPage(),
    );
  }
}
