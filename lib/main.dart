import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: in1()
    );
  }
}
class in1 extends StatefulWidget {
  const in1({super.key});


  @override
  State<in1> createState() => _in1State();
}

class _in1State extends State<in1> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("welcome to firebase",style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),),
      ),
      body: FutureBuilder(
        future: _fApp,
        builder: (context,snapshot){
          if(snapshot.hasError){
            return const Text("something goes wrong");
          } else if(snapshot.hasData){
            return const Text("firebase initialize");
          }
          else{
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
