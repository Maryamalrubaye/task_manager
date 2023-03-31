import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:iau_task_manager/services/service.dart';
import 'package:iau_task_manager/utils/constants.dart';

class DataController extends GetxController {
  DataServices service = DataServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Map<String, dynamic> _oneData = {};
  Map<String, dynamic> get oneData => _oneData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(Constants.GET_TASKS);
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got the data");
      update();
    } else {
      print("we did not get the data");
    }
    _isLoading = false;
  }

  Future<void> postData(String taskTitle, String taskContent) async {
    _isLoading = true;
    Response response = await service.postData(Constants.POST_TASK,
        {"TaskTitle": taskTitle, "TaskContent": taskContent});
    if (response.statusCode == 200) {
      update();
      print("data posted successfully");
    } else {
      print("we did not post the data");
    }
    _isLoading = false;
  }

  Future<void> putData(String taskTitle, String taskContent, String id) async {
    _isLoading = true;
    Response response = await service.putData('${Constants.UPDATE_TASK}' '$id',
        {"TaskTitle": taskTitle, "TaskContent": taskContent});
    if (response.statusCode == 200) {
      update();
      print("data updated successfully");
    } else {
      print("we did not update the data");
    }
    _isLoading = false;
  }

  Future<void> deleteData(String id) async {
    _isLoading = true;
    Response response =
        await service.deleteData('${Constants.DELETE_TASK}' '$id');
    if (response.statusCode == 200) {
      update();
      print("data deleted successfully");
    } else {
      print("we could not delete the data");
    }
    _isLoading = false;
  }

  Future<void> getSpecificData(String id) async {
    _isLoading = true;
    Response response = await service.getData('${Constants.GET_TASK}' '$id');
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("we got the specific data: ${response.body}");
        _oneData = response.body;
      }
      update();
    } else {
      print("the is no data");
    }
    _isLoading = false;
  }
}
