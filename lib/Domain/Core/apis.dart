import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:netflix/Domain/main_data_model.dart';

// Future<mainlist> getDatas()async{

//   final _response = await http.get(Uri.parse("https://api.themoviedb.org/3/trending/all/day?api_key=${apikey}"));

//    final bodyASjson = jsonDecode(_response.body) as Map<String,dynamic>;

//    final Trending_Final_data =  mainlist.fromJson(bodyASjson);

//  return Trending_Final_data;

// }
abstract class ApiCalls {
  Future getmovies();
}

class MovieDB extends ApiCalls {
  @override
  Future<List<Results>> getmovies() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/trending/all/day?api_key=832f94fbd50d1199b97ddc0919a36e4a"));
    Map<String, dynamic> map = json.decode(result.body);

    final data = MovieModel.fromJson(map);
    print(data);
    return data.results!;
// Response res = await get(Uri.parse("https://api.themoviedb.org/3/trending/all/day?api_key=832f94fbd50d1199b97ddc0919a36e4a"));

//     if(res.statusCode==200){
//       final decoded = jsonDecode(res.body);
//       final list = decoded['results'].map((item)=> Results.fromJson(item)).toList();
//       return list;
//     }else{
//       throw "Can't get list";
//     }
  }
}
