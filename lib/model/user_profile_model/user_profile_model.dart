class UserProfile {
  final String id;
  final String name;
  final String email;
  final String contact;
  final String role;
  final Location? location;
  final String? imageUrl;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.role,
    this.location,
    this.imageUrl,
  });

  // Factory constructor to create a UserProfile from a map (JSON)
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'N/A',
      email: json['email'] ?? 'N/A',
      contact: json['contact'] ?? 'N/A',
      role: json['role'] ?? 'N/A',
      location: json["location"] == null
          ? null
          : Location.fromJson(json["location"]),
      imageUrl: json['profile'], // Assuming the key is 'image'
    );
  }

  // Method to convert a UserProfile instance to a map
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'contact': contact,
      'role': role,
      "location": location?.toJson(),
      'profile': imageUrl,
    };
  }
  
  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, email: $email, imageUrl: $imageUrl)';
  }
}

class Location {
  final String locationName;
  final Coordinates coordinates;

  Location({required this.locationName, required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    locationName: json["locationName"],
    coordinates: Coordinates.fromJson(json["coordinates"]),
  );

  Map<String, dynamic> toJson() => {
    "locationName": locationName,
    "coordinates": coordinates.toJson(),
  };
}

class Coordinates {
  final double lat;
  final double lng;

  Coordinates({required this.lat, required this.lng});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      Coordinates(lat: json["lat"]?.toDouble(), lng: json["lng"]?.toDouble());

  Map<String, dynamic> toJson() => {"lat": lat, "lng": lng};
}
