import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../providers/auth_provider.dart';

class ProfileSetupScreen extends StatefulWidget {
  final String userId;
  const ProfileSetupScreen({super.key, required this.userId});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _nameController = TextEditingController();
  String? _gymTime;
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() => _error = 'Please enter your name');
      return;
    }
    if (_gymTime == null) {
      setState(() => _error = 'Please select your preferred gym time');
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });

    await context.read<AuthProvider>().completeProfile(
          userId: widget.userId,
          name: name,
          gymTime: _gymTime!,
        );
    if (!mounted) return;
    // AuthGate ab HomeScreen dikhayega — pushed routes hata do.
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YOUR PROFILE')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.verified_user,
                        color: AppColors.gold, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      'User ID  ${widget.userId}  verified',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const Text('Full Name',
                  style: TextStyle(color: AppColors.textGrey)),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  prefixIcon:
                      Icon(Icons.person_outline, color: AppColors.textGrey),
                ),
              ),
              const SizedBox(height: 22),
              const Text('Preferred Gym Time',
                  style: TextStyle(color: AppColors.textGrey)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _gymTime,
                isExpanded: true,
                dropdownColor: AppColors.card,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.access_time,
                      color: AppColors.textGrey),
                ),
                hint: const Text('Select a time slot',
                    style: TextStyle(color: AppColors.textGrey)),
                items: AppConstants.gymTimeSlots
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (v) => setState(() => _gymTime = v),
              ),
              if (_error != null) ...[
                const SizedBox(height: 14),
                Text(_error!,
                    style: const TextStyle(
                        color: AppColors.danger, fontSize: 13)),
              ],
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saving ? null : _submit,
                child: _saving
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.black,
                        ),
                      )
                    : const Text('ENTER GYM'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
