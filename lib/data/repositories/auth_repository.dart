import 'package:uuid/uuid.dart';
import '../../core/constants/app_constants.dart';
import '../local/local_storage.dart';
import '../models/member.dart';

/// Phase 1: sab kuch local. Phase 2 mein sirf is class ke andar
/// API calls daal denge — baaki poori app untouched rahegi.
class AuthRepository {
  static const String _currentKey = 'current';

  Future<bool> verifyUserId(String userId) async {
    // Phase 2: yahan real API call aayegi ->
    //   final res = await api.get('/verify/$userId');
    await Future.delayed(const Duration(milliseconds: 500)); // fake network
    return AppConstants.validUserIds.contains(userId.trim());
  }

  Future<Member> saveMember({
    required String userId,
    required String name,
    required String gymTime,
  }) async {
    final member = Member(
      id: const Uuid().v4(),
      userId: userId.trim(),
      name: name.trim(),
      gymTime: gymTime,
      joinedAt: DateTime.now(),
    );
    await LocalStorage.memberBox.put(_currentKey, member.toJson());
    return member;
  }

  Member? getCurrentMember() {
    final data = LocalStorage.memberBox.get(_currentKey);
    if (data == null) return null;
    return Member.fromJson(Map<String, dynamic>.from(data));
  }

  Future<void> logout() async {
    await LocalStorage.memberBox.delete(_currentKey);
  }
}
