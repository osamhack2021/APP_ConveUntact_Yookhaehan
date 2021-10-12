import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/manner/manner.dart';
import 'package:myapp/domain/manner/manner_provider.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class MannerRepository {
  UserController u = Get.find<UserController>();
  final MannerProvider _MannerProvider = MannerProvider();

  //관리자페이지 - 모든 부대원의 매너점수 가져오기
  Future<List<Manner>> findByUnitCode(String unitcode) async {
    QuerySnapshot querySnapshot = await _MannerProvider.findByUnitCode(unitcode);
    List<Manner> Manners = querySnapshot.docs
        .map((doc) => Manner.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return Manners;
  }

  //사용자자페이지 - 사용자의 모든 매너점수 가져오기
  Future<List<Manner>> findByUid(String uid) async {
    QuerySnapshot querySnapshot = await _MannerProvider.findByUid(uid);
    List<Manner> Manners = querySnapshot.docs
        .map((doc) => Manner.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return Manners;
  }

  Future<Manner> add(Manner newManner) async {
    DocumentSnapshot result = await _MannerProvider.add(newManner);
    return Manner.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<Manner> findById(String id) async {
    DocumentSnapshot result = await _MannerProvider.findById(id);
    return result.data() == null
        ? Manner()
        : Manner.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<int> updateById(Manner newManner, String id) async {
    // 업데이트 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _MannerProvider.updateById(newManner, id);
    Manner manner = await findById(id);
    return manner.contents == newManner.contents && manner.score == newManner.score ? 1 : -1;
  }

  Future<int> deleteById(String id) async {
    // 삭제 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _MannerProvider.deleteById(id);
    Manner manner = await findById(id);
    return manner.id == null ? 1 : -1;
  }
}