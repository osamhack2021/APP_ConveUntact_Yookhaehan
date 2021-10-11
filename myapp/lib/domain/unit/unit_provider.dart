// FireStore와 통신
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/domain/unit/unit.dart';


class UnitProvider {
  final _collection = "units"; // Firestore Collection 이름

  //unitcode로 units객체 가져오기
  Future<QuerySnapshot> get_unit(String unitcode) => FirebaseFirestore.instance
      .collection(_collection)
      .where("unitcode", isEqualTo: "$unitcode")
      .get();

  //Unit 생성하기
  Future<DocumentReference> join(Unit newUnit) =>
      FirebaseFirestore.instance.collection(_collection).add(newUnit.toJson());

}