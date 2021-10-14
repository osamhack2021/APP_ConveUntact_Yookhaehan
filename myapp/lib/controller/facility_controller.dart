import 'package:get/get.dart';
import 'package:myapp/domain/facility/facility.dart';
import 'package:myapp/domain/facility/facility_repository.dart';

class FacilityController extends GetxController {
  final FacilityRepository _FacilityRepository = FacilityRepository();
  final facilitys = <Facility>[].obs;
  final facility = Facility().obs;
  final unitcode;

  // 객체 생성(create) onInit 함수실행(initialize)
  // FacilityController n = Get.put(FacilityController());
  FacilityController(this.unitcode);

  @override
  void onInit() {
    super.onInit();
    findByUnitCode(unitcode);
  }

  Future<List<Facility>> findByUnitCode(String unitcode) async {
    List<Facility> facilitys = await _FacilityRepository.findByUnitCode(unitcode);
    this.facilitys.value = facilitys;
    return facilitys;
  }

  Future<void> add(Facility newFacility) async {
    Facility facility = await _FacilityRepository.add(newFacility);
    if (facility.id != null) {
      this.facilitys.add(facility);
    }
  }

  Future<void> findById(String id) async {
    Facility facility = await _FacilityRepository.findById(id);
    this.facility.value = facility;
  }

  Future<void> updateById(Facility newFacility, String id) async {
    int result = await _FacilityRepository.updateById(newFacility, id);
    if (result == 1) {
      Facility facility = await _FacilityRepository.findById(id);
      this.facility.value = facility;
      this.facilitys.value = this.facilitys.map((e) => e.id == id ? facility : e).toList();
    }
  }

  Future<int> deleteById(String id) async {
    int result = await _FacilityRepository.deleteById(id);
    if (result == 1) {
      print("서버 쪽 삭제 성공");
      List<Facility> result = facilitys.where((facility) => facility.id != id).toList();
      facilitys.value = result;
    }
    return result;
  }
}