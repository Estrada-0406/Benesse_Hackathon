import 'package:flutter/material.dart';

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
              child : FlatButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NextPage(),
                        )
                    );
                  },
                  child: Text('勉強面')
              ),
            ),
            Expanded(
              child : FlatButton(
                  onPressed: (){
                    print('bbb');
                  },
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
        child : FlatButton(
            onPressed: (){
              print('国語');
            },
            child: Text('国語')
        ),
      ),
      Expanded(
        child : FlatButton(
            onPressed: (){
              print('数学');
            },
            child: Text('数学')
        ),
      ),
      Expanded(
        child : FlatButton(
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
