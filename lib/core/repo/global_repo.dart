import 'package:intl/intl.dart';
import '../connection/rest_service.dart';
import '../init/shared_preferences/shared_preferences.dart';
import '../model/local/file_with_path/file_path_list_model.dart';
import '../model/local/file_with_path/file_path_model.dart';
import '../model/response/upload_aws/upload_aws_list_res_model.dart';
import '../model/response/upload_aws/upload_aws_model.dart';
import '../model/response/upload_aws/upload_aws_res_model.dart';

class GlobalRepo {
  final Singleton _singleton = Singleton();

  Future<void> setExpiresAt() async {
    try {
      final fifteenMinutesFromNow = DateTime.now().add(
        const Duration(hours: 2),
      );
      final formattedDateTime = DateFormat(
        'yyyy-MM-dd HH:mm:ss',
      ).format(fifteenMinutesFromNow);
      await _singleton.setExpiresAt(formattedDateTime);
    } catch (e) {
      rethrow;
    }
  }

  Future<FilePathModel> uploadAws({required FilePathModel? bodyData}) async {
    try {
      final response = await RestService.postUploadAWS(bodyData: bodyData);
      final res = uploadAwsResFromJson(response.response);
      UploadAws? data = res.data;
      return FilePathModel(
        filename: bodyData?.filename,
        fileNetwork: data?.path,
        isURL: true,
        id: bodyData?.id,
        key: bodyData?.key,
        folderName: bodyData?.folderName,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FilePathModel>> uploadAWSMultiple({
    required FilePathListModel bodyData,
  }) async {
    try {
      List<FilePathModel> filePathModelList = bodyData.filePathModel ?? [];
      if (filePathModelList.isEmpty) {
        return [];
      }
      final response = await RestService.postUploadAWSMultiple(
        bodyData: bodyData,
      );
      final res = uploadAwsListResFromJson(response.response);
      List<UploadAws> data = res.data ?? [];
      List<FilePathModel> kFilePathModelList = [];
      for (var item in data) {
        kFilePathModelList.add(
          FilePathModel(
            filename: bodyData.filename,
            fileNetwork: item.path,
            isURL: true,
            folderName: bodyData.folderName,
          ),
        );
      }
      return kFilePathModelList;
    } catch (e) {
      rethrow;
    }
  }
}
