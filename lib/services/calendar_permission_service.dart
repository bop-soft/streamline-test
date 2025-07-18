import 'package:permission_handler/permission_handler.dart';

class CalendarPermissionService {
  static Future<bool> request() async {
    final status = await Permission.calendarFullAccess.request();
    return status.isGranted;
  }
}