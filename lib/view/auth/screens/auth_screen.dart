import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/buttons/auth_button.dart';
import '../../../components/sizing_box.dart';
import '../../../services/app_providers/service_providers.dart';
import '../../../utils/constants/k_assets.dart';
import '../../../utils/constants/k_colors.dart';
import '../../../utils/constants/k_routes.dart';

class AuthScreen extends ConsumerWidget {
  static const String id = KRoutes.authScreen;
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: KColors.blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Hero(
              tag: "splash-logo",
              child: Image.asset(
                KAssets.logo,
                height: 230.sp,
                width: 230.sp,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Jam, request, and \nrock out together!'.toUpperCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w900,
                  color: KColors.whiteColor,
                  fontSize: 18.0,
                ),
              ),
            ),
            Sbh(h: 25.sp),
            AuthButton(
              onPressed: () {},
              fetching: false,
              backgroundColor: KColors.primaryColor,
              title: "Sign up for free",
              asset: '',
            ),
            AuthButton(
              onPressed: () {},
              fetching: false,
              title: "Continue with phone number",
              asset: KAssets.phone,
            ),
            AuthButton(
              onPressed: () {
                ref.read(authServiceProvider).googleSignIn();
              },
              fetching: ref.watch(authProvider).googleLoginInProgress,
              title: "Continue with Google",
              asset: KAssets.google,
            ),
            AuthButton(
              onPressed: () {
                // ref.read(authProvider).configSpotifyLoginProgress(val: false);
              },
              fetching: ref.watch(authProvider).spotifyLoginInProgress,
              title: "Continue with Spotify",
              asset: KAssets.spotify,
            ),
            AuthButton(
              onPressed: () {},
              fetching: false,
              title: "Log in",
              asset: KAssets.logo,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'By logging in, you agree to Songbird\'s \nTerms of Service and Privacy Policy.',
                style: GoogleFonts.poppins(fontSize: 12.0, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            Sbh(h: 50.sp)
          ],
        ),
      ),
    );
  }
}
