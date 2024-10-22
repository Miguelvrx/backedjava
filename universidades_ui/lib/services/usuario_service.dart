import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioService {
  final String baseUrl = 'http://192.168.200.8:8080/api/usuarios';

  Future<void> registrarUsuario(String nombre, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/registrar'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombre': nombre,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al registrar usuario: ${response.body}');
    }
  }

  Future<void> login(String email, String password) async {
  final response = await http.post(
    Uri.parse('$baseUrl/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Error al iniciar sesión: ${response.body}');
  }
}

}
