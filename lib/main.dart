import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_app/arkit.dart';
import 'arkit.dart';


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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      // アプリのテーマの変更(色)
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,

        ),
      ),
      home: const HomePage(),
      // home: Scaffold(
      //   // bodyの設定
      //   appBar:  AppBar(
      //     // header part
      //     title: const Text('Startup Name Generator'),
      //   ),
      //   body: const Center(
      //     // like a <p>
      //     child: RandomWords(),
      //   ),
      // ),
    );
  }
}
class HomePage extends StatefulWidget {
  // const HomePage(this.user);
  // final User user;
  const HomePage({Key? key}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
 

  // final menu_list = ["Star","Post", "Repository", "Browsing", "Camera", "Image"];
  final menu_list = ["Camera", "Image","PM SHOW"];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.logout),
        //     onPressed: () async {
        //       // ログアウト処理
        //       // 内部で保持しているログイン情報等が初期化される
        //       await FirebaseAuth.instance.signOut();
        //       // ログイン画面に遷移してチャット画面を破棄
        //       await Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(builder: (context){
        //           return const LoginPage();
        //         }),
        //       );
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: menu_list.length,
              itemBuilder: (BuildContext, int index){

                return Card(
                  child: ListTile(
                    title: Text(menu_list[index]),
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                          if (index==0){
                            return HomePage();
                          }else if(index==1){
                            return ARKitPage();
                          }else{
                            return ARKitPage();
                          }

                        }),
                      );
                    },
                  ),
                );
                // Card(
                //   child: ListTile(
                //     title: Text(menu_list[1]),
                //   ),
                // );
                // Card(
                //   child: ListTile(
                //     title: Text(menu_list[2]),
                //   ),
                // );
                // Card(
                //   child: ListTile(
                //     title: Text(menu_list[3]),
                //   ),
                // );
              },

            ),
          ),
        ],
      ),
    );
  }
}

class _RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  // widgetの設定
  Widget build(BuildContext context){
    // Scaffold→bodyの設定
    return Scaffold(
      // 画面上に常に表示されるツールバーのこと
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        // 右に表示される
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      // リスト化したいWidgetの数が多い・決まっていないときに使われる
      body: ListView.builder(
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
          final alreadySaved = _saved.contains(_suggestions[index]);
          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red :null,
              semanticLabel: alreadySaved ? 'Remove from saved':'Save',
            ),
            onTap: (){
              setState(() {
                if (alreadySaved){
                  _saved.remove(_suggestions[index]);
                }else{
                  _saved.add(_suggestions[index]);
                }
              });
            },
          );
        },        
      ),
    );
    // ListView→スクロールできるようにするやつ
    // 枠の全ての方向に同じ余白を作る
  }
  void _pushSaved(){
    // ページ繊維を実装する
    // pushメソッド→進む遷移
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair){
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                context: context,
                tiles: tiles,
              ).toList()
              : <Widget>[];
          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
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
