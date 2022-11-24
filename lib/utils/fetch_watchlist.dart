import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:counter_7/models/watchlist_model.dart';

Future<List<Watchlist>> fetchWatchlist() async {
  var url = Uri.parse('https://pbp-tugas2-daniel.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    }
  );

  var datas = jsonDecode(utf8.decode(response.bodyBytes));

  List<Watchlist> listWatchlist = [];
  for (var data in datas) {
    if (data == null) continue;
    listWatchlist.add(Watchlist.fromJson(data));
  }

  return listWatchlist;
}