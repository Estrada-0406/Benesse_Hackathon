import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';
import 'package:newsapi/newsapi.dart';


class Person{
  String firstName;
  String lastName;
  int age;
  String prefecture;
  String favoriteCategory;
  Person(firstName, lastName, age, prefecture){
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.prefecture = prefecture;
    this.favoriteCategory = null;
  }
}

//初期画面(勉強かキャリアの選択)
void main(){
  return runApp(
    MaterialApp(
      home:Scaffold(
        backgroundColor:Colors.white,
        appBar:AppBar(
          title:Text('Choice'),
          backgroundColor:Colors.blue,
        ),
        body:Choice(),
      ),
    ),
  );
}

class Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Row(
          children: <Widget>[
            Expanded(
              child : RaisedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NextPage(),
                        )
                    );
                  },
                  highlightElevation: 16,
                  highlightColor: Colors.blue,
                  onHighlightChanged: (value) {},
                  child: Text('勉強面')
              ),
            ),
            Expanded(
              child : RaisedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NextPage2(),
                        )
                    );
                  },
                  highlightElevation: 16,
                  highlightColor: Colors.blue,
                  onHighlightChanged: (value) {},
                  child: Text('キャリア面')
              ),
            ),
          ]
      ),
    );
  }
}

//勉強面のリンク
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("次のページ"),
        ),
        body: Column(
          children:<Widget>[
            Expanded(
              child : RaisedButton(

                  onPressed: (){
                    print('国語');
                  },
                  child: Text('国語')
              ),
            ),
            Expanded(
              child : RaisedButton(
                  onPressed: (){
                    print('数学');
                  },
                  child: Text('数学')
              ),
            ),
            Expanded(
              child : RaisedButton(
                  onPressed: (){
                    print('理科');
                  },
                  child: Text('理科')
              ),
            ),
          ],
        )
    );
  }
}


//News画面の導入
class NextPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text("キャリア面"),
      ),
      body:Column(
          children:<Widget>[
            Expanded(
                child:Text("次のページでは、気になるトピックとそうでないトピックを選んでね！"
                    "「次へ」ボタンで次に進もう！")
            ),
            Expanded(
              child : RaisedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsScreen(),
                        )
                    );
                  },
                  child: Text('次へ')
              ),
            ),
          ]
      ),
    );
  }
}


//News画面の表示
const apiKey = '3cf1d14308bd4105a2486f2155a49bfa';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  void getNewsData() async {
    var newsApi = NewsApi();
    newsApi.init(
      debugLog: true,
      apiKey: 'foo',
    );

    newsApi.apiKey = apiKey;

    ArticleResponse topHeadlines = await newsApi.topHeadlines(
      country: 'jp',
    );
    List<Object> a = topHeadlines.props;

    var x = topHeadlines.toJson();

    //print(topHeadlines.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TCard(
          cards: [
            Container(color: Colors.blue),
            Container(color: Colors.yellow),
            Container(color: Colors.red),
          ],
        ),
      ),
    );
  }
}
