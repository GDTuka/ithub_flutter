import 'package:http/http.dart' as http;

class Example {
  Future<void> makeRequest() async {
    Uri link = Uri.parse('http://82.202.244.55:8823/registration-service/api/registration/is-login-free');

    http.Response response;

    response = await http.post(link, body: '''

    {
      'userName' : '1234',
    }

''');

    response = await http.get(link);

    //* Нужно сделть приложение которое будет показывать какая погода в Москве, Париже, Ньюйорке.

    print(response.statusCode);
  }
}
