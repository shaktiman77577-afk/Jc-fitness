import 'package:flutter/foundation.dart';
import '../../data/models/member.dart';
import '../../data/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _repo;
  AuthProvider(this._repo) {
    _load();
  }

  Member? _member;
  Member? get member => _member;
  bool get isLoggedIn => _member != null;

  bool _initializing = true;
  bool get initializing => _initializing;

  void _load() {
    _member = _repo.getCurrentMember();
    _initializing = false;
    notifyListeners();
  }

  Future<bool> verifyUserId(String id) => _repo.verifyUserId(id);

  Future<void> completeProfile({
    required String userId,
    required String name,
    required String gymTime,
  }) async {
    _member = await _repo.saveMember(
      userId: userId,
      name: name,
      gymTime: gymTime,
    );
    notifyListeners();
  }

  Future<void> logout() async {
    await _repo.logout();
    _member = null;
    notifyListeners();
  }
}
