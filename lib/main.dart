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
      title: 'Welcome to Flutter',
      home: Scaffold(
        // bodyの設定
        appBar:  AppBar(
          // header part
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          // like a <p>
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
