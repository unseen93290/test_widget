import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_widget/data.dart';
import 'package:test_widget/data_base.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: MyApp()) ,);

}



class MyApp extends StatelessWidget {
  late String text;

  DatabaseJeux databaseJeux1 = DatabaseJeux();

  @override
  Widget build(BuildContext context) {
    return  Builder(
      builder: (context) {
        return MaterialApp(
          home: Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      onChanged: (value) {
                        text = value;
                      },
                    ),
                    FlatButton(
                        onPressed: () {
                          databaseJeux1.createCustomer(Jeux(name: "Nabil",id: 0002,age: 30));
                          //print(databaseJeux1.getListJeux().toString);
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Play()));

                        },
                        child: Text("Appuyer"),),

                  ],

                ),
          ),
        );
      }
    );
  }
}



class Play extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DatabaseJeux databaseJeux2 = DatabaseJeux();
    DatabaseJeux.createDatabase();

    return  Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),),
          body: ListView.builder(itemBuilder: (BuildContext context, int index) { print(databaseJeux2.getCustomers()); return Text(databaseJeux2.foo().toString(),); },
                itemCount: 5,
          ),
        ),

    );
  }
}
