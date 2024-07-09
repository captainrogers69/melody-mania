// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import '../../../utils/constants/k_colors.dart';
// import '../../../utils/constants/k_routes.dart';

// class WebViewLoginScreen extends StatefulHookConsumerWidget {
//   static const id = KRoutes.webLoginScreen;
//   final String url;
//   const WebViewLoginScreen({this.url = '', super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _WebViewLoginScreenState();
// }

// class _WebViewLoginScreenState extends ConsumerState<WebViewLoginScreen> {
//   final cookieManager = WebViewCookieManager();
//   WebViewController? controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(
//         Uri.parse(widget.url),
//       );
//     controller!.addJavaScriptChannel(
//       'FlutterChannel',
//       onMessageReceived: (message) async {},
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     ValueNotifier<bool> isFetchingdUrl = useState(true);
//     useEffect(() {
//       Future.delayed(const Duration(milliseconds: 1500), () {
//         isFetchingdUrl.value = false;
//       });
//       return null;
//     }, []);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.url),
//       ),
//       body: SafeArea(
//         child: CustomScrollView(
//           physics: const ClampingScrollPhysics(),
//           slivers: [
//             SliverToBoxAdapter(
//               child: SizedBox(
//                 height: 100.h - (2 * AppBar().preferredSize.height),
//                 width: 100.w,
//                 child: Visibility(
//                   visible: !isFetchingdUrl.value,
//                   replacement: const Center(
//                     child: CupertinoActivityIndicator(
//                       color: KColors.primaryColor,
//                     ),
//                   ),
//                   child: WebViewWidget(
//                     controller: controller!,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
