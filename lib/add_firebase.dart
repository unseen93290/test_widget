import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_widget/main.dart';

class AddFirebase extends StatelessWidget {
  const AddFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController yearController = TextEditingController();
    final TextEditingController posterController = TextEditingController();

    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Row(
              children:  [
                const Text("Nom : "),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: nameController,
                  ),
                ),

              ],
            ),

          ),
          const SizedBox(height: 20,),



          ListTile(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Row(
              children:  [
                const Text("Poster : "),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: posterController,
                  ),
                ),

              ],
            ),

          ),
          ListTile(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Row(
              children:  [
                const Text("année : "),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: yearController,
                  ),
                ),

              ],
            ),

          ),
         ElevatedButton(onPressed: () {
            FirebaseFirestore.instance.collection("Movies").add({
            'name' : nameController.value.text,
              'poster' : posterController.value.text,
              'année' : yearController.value.text,
            });
          Navigator.pop(context);},
              child: const Text("Ajouter")),

        ],
      ),
    );
  }
}
