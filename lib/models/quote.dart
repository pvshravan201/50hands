import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class Quote {
  List title;
  List imageUrl;
  List description;
  List url;

  Quote() {
    title = [];
    imageUrl = [];
    description = [];
    url = [];
  }

  Future<void> getData() async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    String url1 = 'https://newsfeed.50hands.org:2222/initial';
    //Response response=await post('https://api.infermedica.com/covid19/diagnosis',headers: {"App_Key":"XXX8878"});
    //print(response.body);
    //Map map = {"country": "canada", "category": "vaccine"};

    HttpClientRequest request = await client.postUrl(Uri.parse(url1));

    request.headers.set('content-type', 'application/json');

    //request.add(utf8.encode(json.encode(map)));

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    print(json.decode(reply));

    Map<dynamic, dynamic> responseData = json.decode(reply);
    List<dynamic> data = responseData["data"];

    for (Map map in data) {
      title.add(map["title"]);
      imageUrl.add(map["image_url"]);
      description.add(map["description"]);
      url.add(map["url"]);
    }
  }
} //quotes class
