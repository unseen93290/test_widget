import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_widget/add_firebase.dart';


Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp( debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),home: HomePage()) ,);

}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter firebase"),leading: IconButton(onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const AddFirebase(); })), icon: const Icon(Icons.add)),),
      body: const Movies(),
    );
  }
}

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Movies').snapshots(),
            builder: ( BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
             if (snapshot.hasError) {
               print(snapshot);
                return const Text('Something went wrong');

              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((document ) {
                  return ListTile(
                    title: Text(document['name']),
                    trailing: Image.network(document['poster']),


                  );
                }).toList(),
              );
            },
          ),
        ),
      ),

    );
  }
}




