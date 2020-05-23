abstract class IAuthRepository {
  Future getLoginWithEmailAndPassword(String email, String password);
  Future<Map> getCurrentUser();
  Future getLogOut();
  Future checkAuthStatus();
  Future getDocumentsUser();
}
