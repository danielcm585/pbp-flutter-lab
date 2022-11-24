import 'package:counter_7/components/watchlist_item.dart';
import 'package:counter_7/utils/fetch_watchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/components/drawer.dart';
import 'package:counter_7/models/data_model.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key,
    required this.saveData,
    required this.datas
  });

  final String title = 'My Watchlist';
  final Function(Data newData) saveData;
  final List<Data> datas;

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: AppDrawer(
        saveData: widget.saveData,
        datas: widget.datas,
      ),
      body: FutureBuilder(
        future: fetchWatchlist(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Column(
              children: const [
                Text("Tidak ada watchlist")
              ]
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => WatchlistItem(
              saveData: widget.saveData, 
              datas: widget.datas, 
              watchlist: snapshot.data[index]
            )
          );
        }
      )
    );
  }
}