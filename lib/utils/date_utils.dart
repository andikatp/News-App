import 'package:intl/intl.dart';

String formatDate(String? publishedAt) {
  var time = 'Kosong';
  // 2022-04-21T11:37:19Z
  try {
    final date = DateFormat("yyyy-MM-ddThh:mm:ssZ").parse(publishedAt ?? '');
    final String dateString = DateFormat("dd MMMM yyyy").format(date);
    time = dateString;
  } catch (e) {}
  return time;
}
