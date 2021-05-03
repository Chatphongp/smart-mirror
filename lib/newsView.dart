import 'package:flutter/material.dart';
import 'package:smartmirror/class/apiService.dart';
import 'package:smartmirror/class/constants.dart';

class NewsView extends StatefulWidget {
  NewsView({Key key}) : super(key: key);

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  List<Widget> newsList = [];
  @override
  void initState() {
    super.initState();
    loadNews();
  }

  void loadNews() async {
    List<Widget> _newsList = [];

    var news = await ApiService.getNews();
    if (news != {}) {
      for (var n in news["articles"]) {
        _newsList.add(Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        fit: BoxFit.cover,
                        image: NetworkImage(n["urlToImage"]))),
              ),
              Container(
                width: 200,
                child: Text(
                  n["title"],
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ));
      }
    }

    setState(() {
      newsList = _newsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: newsList,
      ),
    );
  }
}
