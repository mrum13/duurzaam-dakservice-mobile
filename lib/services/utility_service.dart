import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart'; 

class UtilityService {
  static late SharedPreferences _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Check if URL should be opened externally
  static bool shouldOpenExternally(String url) {
    final externalPatterns = [
      'tel:',
      'bel:',
      'mailto:',
      'sms:',
      'whatsapp:',
      'wa.me',
      'maps.google.com',
      'goo.gl/maps',
      'play.google.com',
      'apps.apple.com',
    ];

    return externalPatterns.any((pattern) => url.contains(pattern));
  }

  // Launch external URL
  static Future<void> launchURL(String codeType, String url) async {
    try {
      final Uri uri = Uri.parse(codeType);

      // Special handling for phone numbers
      if (codeType.startsWith('tel:')) {
        await _makePhoneCall(url);
        return;
      }

      if (codeType.startsWith('mailto:')) {
        await _launchEmail(url); 
        return;
      }

      // Special handling for WhatsApp
      if (codeType.contains('wa.me') || codeType.contains('whatsapp')) {
        await _launchWhatsApp(url);
        return;
      }

      // Generic URL launching
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  // Launch phone number
  static Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future<void> _launchEmail(String mailtoUrl) async {
    try {
      final uri = Uri.parse(mailtoUrl);
      final toEmail = uri.path.split('?').first; // Ambil hanya alamat email
      final queryParameters = uri.queryParameters;

      final Email email = Email(
        body: queryParameters['body'] ?? '',
        subject: queryParameters['subject'] ?? '',
        recipients: [toEmail],
        cc: (queryParameters['cc'] ?? '')
            .split(',')
            .where((e) => e.isNotEmpty)
            .toList(),
        bcc: (queryParameters['bcc'] ?? '')
            .split(',')
            .where((e) => e.isNotEmpty)
            .toList(),
        isHTML: false, // Sesuaikan jika Anda mengirim HTML
      );

      await FlutterEmailSender.send(email);
    } catch (e) {
      print('Error launching email with flutter_email_sender: $e');
      // Fallback to url_launcher if flutter_email_sender fails, or show error
      try {
        final Uri fallbackUri = Uri.parse(mailtoUrl);
        if (await canLaunchUrl(fallbackUri)) {
          await launchUrl(fallbackUri);
        } else {
          print('Could not launch email with either method: $mailtoUrl');
        }
      } catch (fallbackError) {
        print('Fallback email launch error: $fallbackError');
      }
    }
  }

  // Launch WhatsApp
  static Future<void> _launchWhatsApp(String whatsappUrl) async {
    try {
      final Uri uri = Uri.parse(whatsappUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      print('Error launching WhatsApp: $e');
    }
  }

  // Handle file upload
  static Future<void> handleFileUpload() async {
    try {
      // Request storage permission
      final status = await Permission.storage.request();
      if (status != PermissionStatus.granted) {
        print('Storage permission denied');
        return;
      }

      // Pick file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        allowedExtensions: null,
      );

      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;
        print('File selected: ${file.name}');

        // Here you can implement file upload logic
        // For example, upload to your server or handle as needed
        await _uploadFile(file);
      }
    } catch (e) {
      print('Error in file upload: $e');
    }
  }

  // Upload file (implement your upload logic here)
  static Future<void> _uploadFile(PlatformFile file) async {
    try {
      // Implement your file upload logic here
      // This could be uploading to your server, cloud storage, etc.
      print('Uploading file: ${file.name}');

      // Example: You might want to send this to your web server
      // or handle it according to your website's file upload mechanism
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  // Save cookie/agreement acceptance
  static Future<void> saveCookieAcceptance(bool accepted) async {
    await _prefs.setBool('cookie_accepted', accepted);
  }

  // Get cookie/agreement acceptance status
  static bool getCookieAcceptance() {
    return _prefs.getBool('cookie_accepted') ?? false;
  }

  // Clear app data
  static Future<void> clearAppData() async {
    await _prefs.clear();
  }

  // Check if first launch
  static bool isFirstLaunch() {
    return _prefs.getBool('first_launch') ?? true;
  }

  // Set first launch completed
  static Future<void> setFirstLaunchCompleted() async {
    await _prefs.setBool('first_launch', false);
  }
}
