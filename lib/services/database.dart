import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');

  void addData(String name, String email){
    collectionReference.add({"name" : name, "email" : email});
    print('Added $name - $email');
  }
  void fetchData(){
    //TODO
  }
  void deleteData(){
    //TODO
  }
}