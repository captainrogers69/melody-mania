import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view/auth/providers/auth_provider.dart';
import '../../view/bottom/providers/bottom_provider.dart';
import '../remote_services/auth_service.dart';
import '../remote_services/spotify_services.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(ref);
});

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref);
});

final bottomProvider = ChangeNotifierProvider<BottomProvider>((ref) {
  return BottomProvider(ref);
});

final spotifyServiceProvider = Provider<SpotifyService>((ref) {
  return SpotifyService(ref);
});
