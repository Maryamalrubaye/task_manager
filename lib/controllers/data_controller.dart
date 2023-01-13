import 'package:get/get.dart';
import 'package:iau_task_manager/services/service.dart';

class DataController extends GetxController {
  DataServices service = DataServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData();
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got the data");
      update();
    } else {
      print("we did not get the data");
    }
  }

  Future<void> postData(String taskTitle, String tskContent) async {
    _isLoading = true;
    Response response = await service
        .postData({"TaskTitle": taskTitle, "TaskContent": tskContent});
    if (response.statusCode == 200) {
      update();
      print("data posted successfully");
    } else {
      print("we did not post the data");
    }
  }
}
