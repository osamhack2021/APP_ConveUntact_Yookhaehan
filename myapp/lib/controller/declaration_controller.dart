import 'package:get/get.dart';
import 'package:myapp/domain/declaration/declaration.dart';
import 'package:myapp/domain/declaration/declaration_repository.dart';

class DeclarationController extends GetxController {
  final DeclarationRepository _DeclarationRepository = DeclarationRepository();
  final declarations = <Declaration>[].obs;
  final declaration = Declaration().obs;
  final unitcode;

  // 객체 생성(create) onInit 함수실행(initialize)
  // DeclarationController n = Get.put(DeclarationController());
  DeclarationController(this.unitcode);

  @override
  void onInit() {
    super.onInit();
    findByUnitCode(unitcode);
  }

  Future<List<Declaration>> findByUnitCode(String unitcode) async {
    List<Declaration> declarations = await _DeclarationRepository.findByUnitCode(unitcode);
    this.declarations.value = declarations;
    return declarations;
  }

  Future<void> add(Declaration newDeclaration) async {
    Declaration declaration = await _DeclarationRepository.add(newDeclaration);
    if (declaration.id != null) {
      this.declarations.add(declaration);
    }
  }

  Future<void> findById(String id) async {
    Declaration declaration = await _DeclarationRepository.findById(id);
    this.declaration.value = declaration;
  }

  Future<void> updateById(Declaration newDeclaration, String id) async {
    int result = await _DeclarationRepository.updateById(newDeclaration, id);
    if (result == 1) {
      Declaration declaration = await _DeclarationRepository.findById(id);
      this.declaration.value = declaration;
      this.declarations.value = this.declarations.map((e) => e.id == id ? declaration : e).toList();
    }
  }

  Future<int> deleteById(String id) async {
    int result = await _DeclarationRepository.deleteById(id);
    if (result == 1) {
      print("서버 쪽 삭제 성공");
      List<Declaration> result = declarations.where((Declaration) => Declaration.id != id).toList();
      declarations.value = result;
    }
    return result;
  }
}