import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/Presentaion/search/widgets/screen_idle_seaarchBar.dart';
import 'package:netflix/Presentaion/search/widgets/screen_serach_resultScreen.dart';
import 'package:netflix/core/colors/Constants.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../main.dart';

List movieQuery_DataBase = [];
String query = "";
String search = "";
movieload_search() async {
  final tmdbWithCustomLogs = TMDB(
    ApiKeys(apikey, Api_Read_access_token),
    logConfig: const ConfigLogger(
      //must be true than only all other logs will be shown
      showLogs: true,
      showErrorLogs: true,
    ),
  );

  Map search_Query = await tmdbWithCustomLogs.v3.search.queryMovies(query);
 // print(search_Query['results']);
  return search_Query['results'];
}

class screen_search extends StatefulWidget {
  screen_search({Key? key}) : super(key: key);

  @override
  State<screen_search> createState() => _screen_searchState();
}

class _screen_searchState extends State<screen_search> {
  @override
  void initState() {
    // TODO: implement initState
  }
  TextEditingController _controller = TextEditingController();

  

  submit_query() {
    return _controller.value.text;
  }

  @override
  Widget build(BuildContext context) {
    var value;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: _controller,
                onSubmitted: (value) {
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const screen_search_result()));
                  setState(
                    () {
                      search = value.trim();
                      query = search;
                    },
                  );
                },
                onTap: () {
                  print(
                    "the query is" + query,
                  );
                  movieload_search();
                },
                backgroundColor: Colors.grey.withOpacity(0.5),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(top: 6, left: 5),
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.grey,
                  ),
                ),
                suffixIcon: const Icon(FontAwesomeIcons.circleXmark,
                    color: Colors.grey),
                style: const TextStyle(color: Colors.white),
              ),
            
              const titile_for_search_screen(Name_of_list: "Top Searches"),
              const Expanded(child: screen_idle_searchBar()),
              // const titile_for_search_screen(Name_of_list: "Movies & TV"),
              // const Expanded(child: screen_search_result()),
            ],
          ),
        ),
      ),
    );
  }
}

class titile_for_search_screen extends StatelessWidget {
  const titile_for_search_screen({Key? key, required this.Name_of_list})
      : super(key: key);

  final Name_of_list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Text(
        Name_of_list,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
