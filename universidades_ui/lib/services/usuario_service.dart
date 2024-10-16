import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioService {
  final String baseUrl = 'http://192.168.200.8:8080/api/usuarios';

  Future<void> registrarUsuario(String nombre, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/registrar'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': nombre,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al registrar el usuario');
    }
  }

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Error en el login');
    }
  }
}
