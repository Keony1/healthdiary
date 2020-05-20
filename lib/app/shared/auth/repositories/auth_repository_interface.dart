abstract class IAuthRepository {
  Future getLoginWithEmailAndPassword(String email, String password);
  Future<Map> getUser();
  Future getLogOut();
  Future checkAuthStatus();
}
