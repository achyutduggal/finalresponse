class Lead {
  final String firstName;
  final String lastName;
  final String email;

  Lead({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  Lead.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'] ?? '',
        lastName = json['lastName'] ?? '',
        email = json['email'] ?? '';
}
