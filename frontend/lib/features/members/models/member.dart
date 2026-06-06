class Member {
  final String id;
  final String nom;
  final String prenom;
  final String email;
  final String telephone;
  final String role;
  final String status;
  final String description;

  Member({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.telephone,
    this.role = 'member',
    this.status = 'active',
    this.description = '',
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['_id'] ?? json['id'] ?? '',
      nom: json['nom'] ?? '',
      prenom: json['prenom'] ?? '',
      email: json['email'] ?? '',
      telephone: json['telephone'] ?? '',
      role: json['role'] ?? 'member',
      status: json['status'] ?? 'active',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'telephone': telephone,
      'role': role,
      'status': status,
      'description': description,
    };
  }

  String get fullName => '$prenom $nom';

  String get initials {
    final p = prenom.isNotEmpty ? prenom[0] : '';
    final n = nom.isNotEmpty ? nom[0] : '';
    return '$p$n'.toUpperCase();
  }

  bool get isActive => status == 'active';
  bool get isAdmin => role == 'admin';
}
