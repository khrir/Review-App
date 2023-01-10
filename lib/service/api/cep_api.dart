import 'dart:convert';
import 'dart:io';

class ApiCEP {
  var _client = HttpClient();

  Future<Map<String, dynamic>> getAdressByCEP(String cep) async {
    var request = await _client
        .getUrl(Uri.parse('https://cdn.apicep.com/file/apicep/$cep.json'));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    var result = jsonDecode(responseBody);
    return result;
  }
}
