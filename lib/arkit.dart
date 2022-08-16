
import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';


class ARKitPage extends StatefulWidget {
  // const HomePage(this.user);
  // final User user;
  const ARKitPage({Key? key}): super(key: key);

  @override
  _ARKitPageState createState() => _ARKitPageState();

}
class _ARKitPageState extends State<ARKitPage>{

  late ARKitController arKitController;
  
  @override
  void dispose(){
    arKitController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
      title: const Text("ARKit in Flutter"),
    ),
  );

}