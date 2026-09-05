/// Computes age in whole years from a dd/MM/yyyy date string. Returns
/// null when the string cannot be parsed; accounts for whether the
/// birthday has already passed this year.
int? computeAgeFromDob(String dobDdMmYyyy, {DateTime? now}) {
  final parts = dobDdMmYyyy.trim().split('/');
  if (parts.length != 3) return null;
  final day = int.tryParse(parts[0]);
  final month = int.tryParse(parts[1]);
  final year = int.tryParse(parts[2]);
  if (day == null || month == null || year == null) return null;
  final reference = now ?? DateTime.now();
  var age = reference.year - year;
  final hadBirthday = reference.month > month ||
      (reference.month == month && reference.day >= day);
  if (!hadBirthday) age--;
  return age < 0 ? null : age;
}
