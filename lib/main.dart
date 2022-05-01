import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


// 一番最初に実行しますよ
void main(){
  runApp(const MyApp());
}

// 状態を管理
class MyApp extends StatelessWidget {
  // StatelessWidget親クラスをMyAppに継承している
  // コンストラクタ→インスタンス生成時に実行される初期化のメソッド
  const MyApp({Key? key}) : super(key: key);
  // コンストラクタにkeyを渡している

  @override
  // StatelessWidgetの性質を引き継いでいる
  // @overrideでその性質を持ったまま上書きをしている
  // メソッドの上書き
  Widget build(BuildContext context){
    // 自身のUIの構成情報
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        // bodyの設定
        appBar:  AppBar(
          // header part
          title: const Text('Startup Name Generator'),
        ),
        body: const Center(
          // like a <p>
          child: RandomWords(),
        ),
      ),
    );
  }
}

class _RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context){
    // ListView→スクロールできるようにするやつ
    return ListView.builder(
      // 枠の全ての方向に同じ余白を作る
      padding: const EdgeInsets.all(16.0),
      // リストを作成する
      // i→行番号
      itemBuilder: /*1*/(context, i){
        // isOdd→奇数のとき
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}

// StatefullWidget→動的
// クラスが2つ必要
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}): super(key: key);

  // RandomWordsでcreateStateをoverride
  @override
  _RandomWordsState createState() => _RandomWordsState();

}
