class ProfileUpdatePayload {
  const ProfileUpdatePayload({
    this.firstName,
    this.lastName,
    this.phone,
    this.avatarFileId,
    this.location,
    this.birthdate,
  });

  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? avatarFileId;
  final String? location;
  final String? birthdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (firstName != null && firstName!.isNotEmpty) {
      map['first_name'] = firstName;
    }
    if (lastName != null && lastName!.isNotEmpty) map['last_name'] = lastName;
    if (phone != null && phone!.isNotEmpty) map['phone'] = phone;
    if (avatarFileId != null && avatarFileId!.isNotEmpty) {
      map['avatar_file_id'] = avatarFileId;
    }
    if (location != null && location!.isNotEmpty) map['location'] = location;
    if (birthdate != null && birthdate!.isNotEmpty) {
      map['birthdate'] = birthdate;
    }
    return map;
  }
}
