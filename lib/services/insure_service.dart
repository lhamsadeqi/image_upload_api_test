import 'package:dio/dio.dart';
import '../constant/api.dart';
import '../models/insurer_model.dart';

class InsurerService {
  static Future<List<InsuredModel>> getAll() async {
    try {
      Dio dio = new Dio();
      Response response = await dio.get(GET_ALL_INSURE);
      List<InsuredModel> list = [];
      if (response.statusCode == 200) {
        response.data.forEach((element) {
          list.add(InsuredModel.fromJson(element));
        });
        return list;
      } else {
        throw Exception("خطایی رخ داده است");
      }
    } catch (e) {
      throw Exception("خطایی رخ داده است");
    }
  }
}
