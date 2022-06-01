import 'package:flutter/material.dart';
import 'package:netflix/Domain/Core/apis.dart';
import 'package:netflix/Domain/main_data_model.dart';
import 'package:netflix/Presentaion/widgets/Main_title.dart';
import 'package:netflix/Presentaion/search/widgets/screen_serach_resultScreen.dart';
import 'package:netflix/core/colors/Constants.dart';
import 'package:netflix/core/colors/Strings.dart';
import 'package:netflix/main.dart';


class MainCrdSample extends StatelessWidget {


   MainCrdSample({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: MainTitle(Name_of_list: "Now Playing"),
        ),
        IconButton(onPressed: ()async{
          MovieDB().getmovies();
        }, icon: Icon(Icons.abc_outlined,color: Colors.amber,size: 30,)),
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
            future: MovieDB().getmovies(),
            builder: (context, AsyncSnapshot<List<Results>> sampletrending) {
              
              if(sampletrending.data==null){
                return CircularProgressIndicator();
              }
              return ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  sampletrending.data!.length,
                  (index) {
                    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        height: 190,
        width: 120,
        child: ClipRRect(
          borderRadius: cardBorder,
          child: Image.network(
           "$url${sampletrending.data![index].posterPath}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
                  },
                ),
              );
            }
          ),
        )
      ],
    );
  }
}
