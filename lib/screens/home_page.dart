import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:duurzaam_dakservice/services/notification_service.dart';
import 'package:duurzaam_dakservice/services/utility_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _hasError = false;
  String _currentUrl = 'https://duurzaamdakservice.nl';

  @override
  void initState() {
    super.initState();
    _initializeWebView();
    _checkConnectivity();
    NotificationService.requestPermissions();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color.fromARGB(255, 255, 255, 255))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update progress indicator
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
              _hasError = false;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              _hasError = true;
              _isLoading = false;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            // Handle external links
            if (UtilityService.shouldOpenExternally(request.url)) {
              UtilityService.launchURL(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'FileUpload',
        onMessageReceived: (JavaScriptMessage message) {
          UtilityService.handleFileUpload();
        },
      )
      ..loadRequest(Uri.parse(_currentUrl));
  }

  void _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _showNoConnectionDialog();
    }
  }

  void _showNoConnectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Geen internetverbinding'),
          content: const Text(
              'Controleer uw internetverbinding en probeer opnieuw.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _reloadPage();
              },
              child: const Text('Opnieuw proberen'),
            ),
          ],
        );
      },
    );
  }

  void _reloadPage() {
    _controller.reload();
  }

  Future<bool> _onWillPop() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor:
            Colors.white, // Warna status bar khusus untuk halaman ini
        statusBarIconBrightness:
            Brightness.dark, // Ikon gelap untuk latar terang
        statusBarBrightness: Brightness.light, // Ikon terang untuk iOS
      ),
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (_isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (_hasError)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Er is een fout opgetreden',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Controleer uw internetverbinding en probeer opnieuw.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _reloadPage,
                          child: const Text('Opnieuw laden'),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
