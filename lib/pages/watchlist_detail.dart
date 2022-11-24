import 'package:counter_7/components/drawer.dart';
import 'package:counter_7/models/data_model.dart';
import 'package:counter_7/models/watchlist_model.dart';
import 'package:flutter/material.dart';

class WatchlistDetailPage extends StatelessWidget {
  const WatchlistDetailPage({super.key, 
    required this.saveData, 
    required this.datas, 
    required this.watchlist
  });

  final String title = 'Detail';
  final Function(Data newData) saveData;
  final List<Data> datas;
  final Watchlist watchlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: AppDrawer(
        saveData: saveData,
        datas: datas
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                watchlist.title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )
              )
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Release Date: ',
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                Text('${watchlist.releaseDate}')
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Rating: ',
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                Text('${watchlist.rating}')
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Status: ',
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                Text(watchlist.watched! ? 'watched' : 'not watched')
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Status: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(watchlist.review!)
              ],
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SizedBox(
          width: double.maxFinite,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )
              )
            ),
            onPressed: () {
              Navigator.pop(context);
            }, 
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Back',
                style: TextStyle(
                  fontSize: 15
                ),
              ),
            )
          )
        )
      )
    );
  }
}