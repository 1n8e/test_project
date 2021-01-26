class Contacts {
  final int id;
  final String name;
  final String username;
  final String email;
  final String street;
  final String suite;
  final dynamic lat;
  final dynamic lng;
  final String phone;
  final String website;
  final String companyName;

  Contacts(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.street,
      this.suite,
      this.lat,
      this.lng,
      this.phone,
      this.website,
      this.companyName});

  factory Contacts.fromJson(Map<String, dynamic> json) {
    return Contacts(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      street: json['address']['street'] as String,
      suite: json['address']['suite'] as String,
      lat: json['address']['geo']['lat'] as dynamic,
      lng: json['address']['geo']['lng'] as dynamic,
      phone: json['phone'] as String,
      website: json['website'] as String,
      companyName: json['company']['name'] as String,
    );
  }
}
