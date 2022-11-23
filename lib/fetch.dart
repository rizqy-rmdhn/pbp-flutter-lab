import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pbp_flutter_lab/model/mywatchlist.dart';


Future<List<Mywatchlist>> fetchMyWatchlist() async {
  var url =
      Uri.parse('http://tugas2pbpkiram.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchlist
  List<Mywatchlist> listMyWatchlist = [];
  for (var datum in data) {
    if (datum != null) {
      listMyWatchlist.add(Mywatchlist.fromJson(datum));
    }
  }

  return listMyWatchlist;
}