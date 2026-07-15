# JC Fitness — Phase 1 (Login Flow)

## Folder structure
```
jc_fitness/
├── pubspec.yaml
└── lib/
    ├── main.dart
    ├── core/
    │   ├── constants/
    │   │   └── app_constants.dart
    │   └── theme/
    │       └── app_theme.dart
    ├── data/
    │   ├── models/
    │   │   └── member.dart
    │   ├── local/
    │   │   └── local_storage.dart
    │   └── repositories/
    │       └── auth_repository.dart
    └── presentation/
        ├── providers/
        │   └── auth_provider.dart
        └── screens/
            ├── login/
            │   └── login_screen.dart
            ├── profile/
            │   └── profile_setup_screen.dart
            └── home/
                └── home_screen.dart
```

## Setup (Codespaces / terminal)

### Option A — Naya project banao, phir files replace karo (RECOMMENDED)
```bash
flutter create --org com.jcfitness jc_fitness
cd jc_fitness
# ab is zip ke andar wali `lib/` folder aur `pubspec.yaml` ko
# apne naye project mein REPLACE kar do (purani lib/ hata do)
flutter pub get
flutter run
```

### Option B — Sidha extract karke (agar Flutter project already scaffolded hai)
```bash
# zip extract karo, phir project folder ke andar:
flutter pub get
flutter run
```

## Test
- User ID `7`  → verify pass → Name + Gym Time → Home dashboard ✅
- Koi bhi aur ID → "Invalid User ID. Please contact the gym." ❌
- App band karke dobara kholo → seedha Home (login yaad rahega)
- Home ke logout button se wapas login screen

## Important note
Is zip mein sirf `lib/` + `pubspec.yaml` hai — matlab aapka app ka
ASLI code. Baaki folders (android/, ios/, .metadata, etc.) `flutter create`
command khud bana deti hai. Isliye Option A follow karna sabse safe hai.
