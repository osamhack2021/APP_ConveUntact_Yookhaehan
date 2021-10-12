import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/declaration/declaration.dart';
import 'package:myapp/domain/declaration/declaration.provider.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class DeclarationRepository {
  UserController u = Get.find<UserController>();
  final DeclarationProvider _DeclarationProvider = DeclarationProvider();

  Future<List<Declaration>> findbyCode(String unitcode) async {
    QuerySnapshot querySnapshot = await _DeclarationProvider.findbyCode(unitcode);
    List<Declaration> declarations = querySnapshot.docs
        .map((doc) => Declaration.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return declarations;
  }

  Future<Declaration> add(Declaration newDeclaration) async {
    DocumentSnapshot result = await _DeclarationProvider.add(newDeclaration);
    return Declaration.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<Declaration> findById(String id) async {
    DocumentSnapshot result = await _DeclarationProvider.findById(id);
    return result.data() == null
        ? Declaration()
        : Declaration.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<int> updateById(Declaration newDeclaration, String id) async {
    // 업데이트 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _DeclarationProvider.updateById(newDeclaration, id);
    Declaration declaration = await findById(id);
    return declaration.contents == newDeclaration.contents && declaration.unitcode == newDeclaration.unitcode ? 1 : -1;
  }

  Future<int> deleteById(String id) async {
    // 삭제 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _DeclarationProvider.deleteById(id);
    Declaration declaration = await findById(id);
    return declaration.id == null ? 1 : -1;
  }
}