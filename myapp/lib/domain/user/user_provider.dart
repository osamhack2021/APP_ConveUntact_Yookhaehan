// FireStore와 통신
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/domain/user/user.dart';
import 'package:myapp/domain/unit/unit.dart';

class UserProvider {
  final _collection = "users"; // Firestore Collection 이름

  //id 값으로 User객체 가져오기
  Future<QuerySnapshot> login(String uid) => FirebaseFirestore.instance
      .collection(_collection)
      .where("uid", isEqualTo: "$uid")
      .get();

  //User 생성하기
  Future<DocumentReference> join(User newUser){
    Unit newUnit = Unit(email:newUser.email);
    FirebaseFirestore.instance.collection(_collection).add(newUnit.toJson());
    return FirebaseFirestore.instance.collection(_collection).add(newUser.toJson());
  }
      
  Future<QuerySnapshot> findByEmail(String email) => FirebaseFirestore.instance
      .collection(_collection)
      .where("email", isEqualTo: email)
      .get();

  //email 중복체크
  Future<QuerySnapshot> checkEmail(String email) => FirebaseFirestore.instance
      .collection(_collection)
      .where("email", isEqualTo: email)
      .get();

  //name 중복체크
  Future<QuerySnapshot> checkUsername(String username) =>
      FirebaseFirestore.instance
          .collection(_collection)
          .where("username", isEqualTo: username)
          .get();
}