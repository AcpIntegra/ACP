import 'package:acp_app/data/models/annals_and_aimcc/user.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/utils/constants/db_tables.dart';
import 'package:intl/intl.dart';

Future<void> pushErrorLog(String funName, String errorMessage) async {
  final logRepository = DataRepository();
  final error = DataModel(data: {
    'functionName': funName,
    'error': errorMessage,
    'createdAt': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())
  });
  await logRepository.insert(error, TableNames.errorLog);
}
