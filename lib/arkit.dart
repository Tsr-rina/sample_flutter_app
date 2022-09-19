
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/src/material/colors.dart';


class ARKitPage extends StatefulWidget {
  // const HomePage(this.user);
  // final User user;
  const ARKitPage({Key? key}): super(key: key);

  @override
  _ARKitPageState createState() => _ARKitPageState();

}
class _ARKitPageState extends State<ARKitPage>{

  bool form_isVisible = false;
  bool stamp_isVisible = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("PM SHOW"),
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          child:Column(
            children:[
              Row(
                // 中央寄せ
                // mainAxisAlignment: MainAxisAlignment.center,
                // 均等配置
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                        setState(toggleShowForm);
                      }, 
                      child: const Text("Message"),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(toggleShowStamp);
                        },
                        child: const Text("Stamp")
                    )
                  )
                ],
              ),
              Visibility(
                visible: form_isVisible,
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "メッセージを入力してね"),
                  keyboardType: TextInputType.multiline,
                  maxLines: 20,
                ),
              ),
              Visibility(
                visible: stamp_isVisible,
                child: Container(
                  margin: EdgeInsets.all(50),
                  width: 400,
                  height: 350,
                  child: Column(
                    children: [
                      Container(
                        child: const Text("スタンプを選んでね"),
                      ),
                      Container(
                        child: Image.asset("images/heart.JPG"),
                      )
                    ],
                  ),
                ), 
              ),
            ],
          ),
      ),
    );
  }
  void toggleShowForm(){
    form_isVisible =! form_isVisible;
    stamp_isVisible = false;
  }

  void toggleShowStamp(){
    stamp_isVisible =! stamp_isVisible;
    form_isVisible = false;
  }

}