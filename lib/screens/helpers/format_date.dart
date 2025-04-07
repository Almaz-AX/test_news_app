String formatToLocalDate(DateTime publishDate) {
  final localDate = publishDate.toLocal();
  final day = localDate.day.toString().padLeft(2, '0');
  final month = localDate.month.toString().padLeft(2, '0');
  final year = localDate.year;
  final hour = localDate.hour.toString().padLeft(2, '0');
  final minute = localDate.minute.toString().padLeft(2, '0');
  
  return '$day,$month,$year $hour:$minute';
}
