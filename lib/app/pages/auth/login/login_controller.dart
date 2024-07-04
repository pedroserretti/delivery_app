
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../repositories/auth/auth_repository.dart';
import 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginController(this._authRepository) : super(const LoginState.initial());
  
  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.login));
    final authModel = _authRepository.login(email, password);
    final sp = await SharedPreferences.getInstance();
  }
}