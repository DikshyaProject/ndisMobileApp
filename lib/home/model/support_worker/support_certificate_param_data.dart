class SupportCertificateParam{
  List<String> id;
  String otherCertificate;
  SupportCertificateParam({required this.id,required this.otherCertificate});

  Map toJson() => {
    'ids': id,
    'other_certificates': otherCertificate,
  };
}