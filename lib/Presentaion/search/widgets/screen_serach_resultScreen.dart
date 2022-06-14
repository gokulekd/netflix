

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/Presentaion/search/Search_screen.dart';
import 'package:netflix/core/colors/Constants.dart';

import '../../../core/colors/Strings.dart';

final image_url =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/sKCr78MXSLixwmZ8DyJLrpMsd15.jpg";
final image_url1 =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/wJJt1HG62h3WoGnLcRIbO2nNNkg.jpg";

class screen_search_result extends StatefulWidget {

  const screen_search_result({Key? key,}) : super(key: key);

  @override
  State<screen_search_result> createState() => _screen_search_resultState();
}

class _screen_search_resultState extends State<screen_search_result> {
  
  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: movieload_search(),
     builder: (context, AsyncSnapshot<dynamic>movie_data_qure){
         
            if(movie_data_qure.data== null){
             return Container(
               height: double.infinity,
               width: double.infinity,
               child: const Center(
                 child: SizedBox(
                   height: 50,
                   width: 50,
                   child: CircularProgressIndicator()),
               ));
            }
            else{
        return 
        
        Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                 CupertinoSearchTextField(
            
                onSubmitted: (value) {
          
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(query,style: TextStyle(fontSize: 25,),),
                ),
                
                Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.4,
                    children: List.generate( movie_data_qure.data.length, (index) {
                      return MainCard(
                        ListName: Base_URL+movie_data_qure.data[index]['poster_path'].toString()
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      }
     }
    );
  }
}

class MainCard extends StatelessWidget {
  final String ListName;
  const   MainCard({Key? key, required this.ListName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        height: 190,
        width: 120,
        child: ClipRRect(
          borderRadius: cardBorder,
          child: Image.network(
            Base_URL+ ListName,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
