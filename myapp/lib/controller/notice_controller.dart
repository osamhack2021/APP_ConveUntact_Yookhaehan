import 'package:get/get.dart';
import 'package:myapp/domain/notice/notice.dart';
import 'package:myapp/domain/notice/notice_repository.dart';

class NoticeController extends GetxController {
  final NoticeRepository _NoticeRepository = NoticeRepository();
  final notices = <Notice>[].obs;
  final notice = Notice().obs;
  final unitcode;

  // 객체 생성(create) onInit 함수실행(initialize)
  // NoticeController n = Get.put(NoticeController());
  NoticeController(this.unitcode);

  @override
  void onInit() {
    super.onInit();
    findByUnitCode(unitcode);
  }

  Future<List<Notice>> findByUnitCode(String unitcode) async {
    List<Notice> Notices = await _NoticeRepository.findbyCode(unitcode);
    this.notices.value = Notices;
    return Notices;
  }

  Future<void> add(Notice newnotice) async {
    Notice notice = await _NoticeRepository.add(newnotice);
    if (notice.id != null) {
      this.notices.add(notice);
    }
  }

  Future<void> findById(String id) async {
    Notice notice = await _NoticeRepository.findById(id);
    this.notice.value = notice;
  }

  Future<void> updateById(Notice newnotice, String id) async {
    int result = await _NoticeRepository.updateById(newnotice, id);
    if (result == 1) {
      Notice notice = await _NoticeRepository.findById(id);
      this.notice.value = notice;
      this.notices.value = this.notices.map((e) => e.id == id ? notice : e).toList();
    }
  }

  Future<int> deleteById(String id) async {
    int result = await _NoticeRepository.deleteById(id);
    if (result == 1) {
      print("서버 쪽 삭제 성공");
      List<Notice> result = notices.where((Notice) => Notice.id != id).toList();
      notices.value = result;
    }
    return result;
  }
}