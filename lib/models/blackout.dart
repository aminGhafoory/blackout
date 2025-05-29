class OutageReport {
  final String timeStamp;
  final int status;
  final String sessionKey;
  final String message;
  final List<OutageData> data;
  final dynamic error;

  OutageReport({
    required this.timeStamp,
    required this.status,
    required this.sessionKey,
    required this.message,
    required this.data,
    this.error,
  });

  factory OutageReport.fromJson(Map<String, dynamic> json) {
    return OutageReport(
      timeStamp: json['TimeStamp'],
      status: json['status'],
      sessionKey: json['SessionKey'],
      message: json['message'],
      data: (json['data'] as List).map((i) => OutageData.fromJson(i)).toList(),
      error: json['error'],
    );
  }
}

class OutageData {
  final String regDate;
  final String registrar;
  final String reasonOutage;
  final String outageDate;
  final String outageTime;
  final String outageStartTime;
  final String outageStopTime;
  final bool isPlanned;
  final String address;
  final String outageAddress;
  final int city;
  final int outageNumber;
  final int trackingCode;

  OutageData({
    required this.regDate,
    required this.registrar,
    required this.reasonOutage,
    required this.outageDate,
    required this.outageTime,
    required this.outageStartTime,
    required this.outageStopTime,
    required this.isPlanned,
    required this.address,
    required this.outageAddress,
    required this.city,
    required this.outageNumber,
    required this.trackingCode,
  });

  factory OutageData.fromJson(Map<String, dynamic> json) {
    return OutageData(
      regDate: json['reg_date'],
      registrar: json['registrar'],
      reasonOutage: json['reason_outage'],
      outageDate: json['outage_date'],
      outageTime: json['outage_time'],
      outageStartTime: json['outage_start_time'],
      outageStopTime: json['outage_stop_time'],
      isPlanned: json['is_planned'],
      address: json['address'],
      outageAddress: json['outage_address'],
      city: json['city'],
      outageNumber: json['outage_number'],
      trackingCode: json['tracking_code'],
    );
  }
}

String convertArabicToPersian(String? input) {
  final Map<String, String> replacements = {
    'ي': 'ی', // Arabic Yeh to Persian Yeh
    'ك': 'ک', // Arabic Kaf to Persian Kaf
    '‍': '', // Zero-width joiner
    'ة': 'ه', // Teh Marbuta to Heh
    'ـ': '', // Kashida (Tatweel)
    'أ': 'ا', // Alef with Hamza above
    'إ': 'ا', // Alef with Hamza below
    'ٱ': 'ا', // Alef Wasla
    'ء': '', // Hamza (can be kept or removed depending on use case)
    'آ': 'ا', // Alef Madda to Alef (optional)
  };

  String result = input ?? "";
  replacements.forEach((arabicChar, persianChar) {
    result = result.replaceAll(arabicChar, persianChar);
  });

  return result;
}
