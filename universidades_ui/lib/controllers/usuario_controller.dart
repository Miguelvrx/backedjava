import 'package:get/get.dart';
import '../services/usuario_service.dart';

class UsuarioController extends GetxController {
  final usuarioService = UsuarioService();

  Future<String?> registrarUsuario(String nombre, String email, String password) async {
    try {
      await usuarioService.registrarUsuario(nombre, email, password);
      return null; // Registro exitoso
    } catch (e) {
      return e.toString(); // Devuelve el mensaje de error
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      await usuarioService.login(email, password);
      return null; // Login exitoso
    } catch (e) {
      return e.toString(); // Devuelve el mensaje de error
    }
  }
}
