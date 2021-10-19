import 'package:get/get.dart';
import 'package:myapp/domain/manner/manner.dart';
import 'package:myapp/domain/manner/manner_repository.dart';

class MannerController extends GetxController {
  final MannerRepository _MannerRepository = MannerRepository();
  final manners = <Manner>[].obs;
  final manner = Manner().obs;
  final unitcode;

  // 객체 생성(create) onInit 함수실행(initialize)
  // MannerController n = Get.put(MannerController());
  MannerController(this.unitcode);

  @override
  void onInit() {
    super.onInit();
    findByUnitCode(unitcode);
  }

  Future<List<Manner>> findByUnitCode(String unitcode) async {
    List<Manner> manners = await _MannerRepository.findByUnitCode(unitcode);
    this.manners.value = manners;
    return manners;
  }

  Future<List<Manner>> findByUid(String uid) async {
    List<Manner> manners = await _MannerRepository.findByUid(uid);
    this.manners.value = manners;
    return manners;
  }

  Future<void> add(Manner newManner) async {
    Manner manner = await _MannerRepository.add(newManner);
    if (manner.id != null) {
      this.manners.add(manner);
    }
  }

  Future<void> findById(String id) async {
    Manner manner = await _MannerRepository.findById(id);
    this.manner.value = manner;
  }

  Future<void> updateById(Manner newManner, String id) async {
    int result = await _MannerRepository.updateById(newManner, id);
    if (result == 1) {
      Manner manner = await _MannerRepository.findById(id);
      this.manner.value = manner;
      this.manners.value = this.manners.map((e) => e.id == id ? manner : e).toList();
    }
  }

  Future<int> deleteById(String id) async {
    int result = await _MannerRepository.deleteById(id);
    if (result == 1) {
      print("서버 쪽 삭제 성공");
      List<Manner> result = manners.where((manner) => manner.id != id).toList();
      manners.value = result;
    }
    return result;
  }
}