import 'package:flutter/material.dart';
import 'package:pbp_flutter_lab/main.dart';
import 'package:pbp_flutter_lab/drawer.dart';

class MoviePage extends StatelessWidget {
  const MoviePage(
      {super.key,
      required this.listBudget,
      required this.addBudget,
      required this.watched,
      required this.title,
      required this.rating,
      required this.releaseDate,
      required this.review});

  final List<Budget> listBudget;
  final Function(Budget) addBudget;
  final int watched;
  final String title;
  final int rating;
  final DateTime releaseDate;
  final String review;

  @override
  Widget build(BuildContext context) {
    var date = releaseDate.toString().substring(0, 10);
    var ratingStr = rating.toString();
    var watchedStr;
    if (watched == 1) {
      watchedStr = 'watched';
    } 
    else {
      watchedStr = 'not watched';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
        ),

        // Menambahkan drawer menu
        drawer: MyDrawer(
          listBudget: listBudget,
          addBudget: addBudget,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Container(
                child: Align(
              alignment: Alignment.center,
              child: Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
            )),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Release Date: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(date),
            ]),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Rating: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$rating/5'),
            ]),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Watched: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(watchedStr),
            ]),
            const SizedBox(height: 20.0),
            Text('Review:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(review),
            Spacer(),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                    ))),
          ],
        ));
  }
}