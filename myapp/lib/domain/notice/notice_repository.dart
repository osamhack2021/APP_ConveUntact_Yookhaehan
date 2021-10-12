import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/notice/notice.dart';
import 'package:myapp/domain/notice/notice_provider.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class NoticeRepository {
  UserController u = Get.find<UserController>();
  final NoticeProvider _NoticeProvider = NoticeProvider();

  Future<List<Notice>> findbyCode(String unitcode) async {
    QuerySnapshot querySnapshot = await _NoticeProvider.findbyCode(unitcode);
    List<Notice> Notices = querySnapshot.docs
        .map((doc) => Notice.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return Notices;
  }

  Future<Notice> add(Notice newNotice) async {
    DocumentSnapshot result = await _NoticeProvider.add(newNotice);
    return Notice.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<Notice> findById(String id) async {
    DocumentSnapshot result = await _NoticeProvider.findById(id);
    return result.data() == null
        ? Notice()
        : Notice.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<int> updateById(Notice newNotice, String id) async {
    // 업데이트 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _NoticeProvider.updateById(newNotice, id);
    Notice notice = await findById(id);
    return notice.contents == newNotice.contents && notice.unitcode == newNotice.unitcode ? 1 : -1;
  }

  Future<int> deleteById(String id) async {
    // 삭제 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _NoticeProvider.deleteById(id);
    Notice notice = await findById(id);
    return notice.id == null ? 1 : -1;
  }
}