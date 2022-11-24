import 'package:counter_7/models/data_model.dart';
import 'package:counter_7/models/watchlist_model.dart';
import 'package:counter_7/pages/watchlist_detail.dart';
import 'package:flutter/material.dart';

class WatchlistItem extends StatefulWidget {
  const WatchlistItem({super.key,
    required this.saveData,
    required this.datas,
    required this.watchlist
  });

  final Function(Data newData) saveData;
  final List<Data> datas;
  final Watchlist watchlist;

  @override
  State<WatchlistItem> createState() => _WatchlistItemState();
}

class _WatchlistItemState extends State<WatchlistItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => WatchlistDetailPage(
              saveData: widget.saveData,
              datas: widget.datas,
              watchlist: widget.watchlist
            )
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0
            )
          ]
        ),
        child: Text(
          "${widget.watchlist.title}",
        )
      ),
    );
  }
}