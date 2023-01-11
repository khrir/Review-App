import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:review_app/models/materia_model.dart';
import 'package:review_app/models/question_model.dart';
import 'package:review_app/models/user.dart';

class FastApiLean {
  getMateriasData() async {
    Uri url = Uri.https('consume-api-data.onrender.com', '/materias');

    http.Response response = await http.get(url);
    var responsePT = const Utf8Decoder().convert(response.bodyBytes);
    List<MateriaModel> json = jsonDecode(responsePT)
        .map((item) => MateriaModel.fromJson(item))
        .toList()
        .cast<MateriaModel>();
    return json;
  }

  getQuestoesData() async {
    Uri url = Uri.https('consume-api-data.onrender.com', '/questoes');

    http.Response response = await http.get(url);
    var responsePT = const Utf8Decoder().convert(response.bodyBytes);
    List<QuestionModel> json = jsonDecode(responsePT)
        .map((item) => QuestionModel.fromJson(item))
        .toList()
        .cast<QuestionModel>();

    return json;
  }

  getUsersData() async {
    Uri url = Uri.https('consume-api-data.onrender.com', '/usuarios');

    http.Response response = await http.get(url);
    var responsePT = const Utf8Decoder().convert(response.bodyBytes);
    List<User> json = jsonDecode(responsePT)
        .map((item) => User.fromJson(item))
        .toList()
        .cast<User>();

    return json;
  }
}
