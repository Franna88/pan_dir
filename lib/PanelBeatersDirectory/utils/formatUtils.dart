String limitString(String text, int limit) {
  return text.length > limit ? '${text.substring(0, limit)}...' : text;
}

String maskEmail(String email) {
  // Split the email into local part and domain part
  final parts = email.split('@');
  if (parts.length != 2) return email; // Invalid email format

  String localPart = parts[0];
  String domainPart = parts[1];

  if (localPart.length <= 2) {
    // If local part is too short, we can mask only the middle character or just return a basic mask
    return localPart[0] + "*" + '@' + domainPart;
  }

  // Show first and last character of the local part and mask the rest
  String maskedLocalPart = localPart[0] +
      '*' * (localPart.length - 2) +
      localPart[localPart.length - 1];

  // Combine the masked local part and the domain
  return maskedLocalPart + '@' + domainPart;
}

String maskPhoneNumber(String phoneNumber) {
  // Remove all non-digit characters
  String cleanedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Check if the cleaned number is long enough to mask
  if (cleanedNumber.length < 4) {
    return "Invalid phone number"; // Handle edge case where the number is too short
  }

  // Mask all but the last 4 digits
  String masked = cleanedNumber.length > 4
      ? '${'*' * (cleanedNumber.length - 4)}${cleanedNumber.substring(cleanedNumber.length - 4)}'
      : cleanedNumber;

  return masked;
}
