class SentOtpParam {
  String email_id;
  String mobile_number;

  SentOtpParam({required this.email_id, required this.mobile_number});

  Map<String, Object> toMap() {
    return {"email_id": email_id, "mobile_number": mobile_number};
  }
}
