import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/facility/facility.dart';
import 'package:myapp/domain/facility/facility_provider.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class FacilityRepository {
  UserController u = Get.find<UserController>();
  final FacilityProvider _FacilityProvider = FacilityProvider();

  // 부대코드로 시설물 리스트 불러오기
  Future<List<Facility>> findByUnitCode(String unitcode) async {
    QuerySnapshot querySnapshot = await _FacilityProvider.findByUnitCode(unitcode);
    List<Facility> facilitys = querySnapshot.docs
        .map((doc) => Facility.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return facilitys;
  }

  Future<Facility> add(Facility newFacility) async {
    DocumentSnapshot result = await _FacilityProvider.add(newFacility);
    return Facility.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<Facility> findById(String id) async {
    DocumentSnapshot result = await _FacilityProvider.findById(id);
    return result.data() == null
        ? Facility()
        : Facility.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<int> updateById(Facility newFacility, String id) async {
    // 업데이트 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _FacilityProvider.updateById(newFacility, id);
    Facility facility = await findById(id);
    return facility.detail == newFacility.detail && facility.unitcode == newFacility.unitcode ? 1 : -1;
  }

  Future<int> deleteById(String id) async {
    // 삭제 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _FacilityProvider.deleteById(id);
    Facility facility = await findById(id);
    return facility.id == null ? 1 : -1;
  }
}