import 'package:get/get.dart';
import '../services/usuario_service.dart';

class UsuarioController extends GetxController {
  final usuarioService = UsuarioService();

  Future<void> registrarUsuario(String nombre, String email, String password) async {
    await usuarioService.registrarUsuario(nombre, email, password);
  }

  Future<void> login(String email, String password) async {
    await usuarioService.login(email, password);
  }
}
