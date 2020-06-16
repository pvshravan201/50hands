import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class Quote{

  List title;
  List imageUrl;
  List description;
  List url;

  Quote(){
    title=[];
    imageUrl=[];
    description=[];
    url=[];
  }

  Future<void> getData() async{
    Response response = await get('https://newsfeed-50handsorg.herokuapp.com/extract');
    Map<dynamic,dynamic> responseData=jsonDecode(response.body);

    List<dynamic> data= responseData["data"];

    for(Map map in data){
      title.add(map["title"]);
      imageUrl.add(map["image_url"]);
      description.add(map["description"]);
      url.add(map["url"]);
    }


  }

}//quotes class