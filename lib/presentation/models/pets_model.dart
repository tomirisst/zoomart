// class Pets {
//   final int? id;
//   final String? name;
//   final String? group;
//   final String? city;
//   final String? description;
//   final String? gender;
//   final String? photos;
//   final String? ownerNumber;
//
//   const Pets({
//     required this.id,
//     required this.name,
//     required this.group,
//     required this.city,
//     required this.description,
//     required this.gender,
//     required this.photos,
//     required this.ownerNumber,
//   });
//
//   factory Pets.fromJson(Map<String, dynamic> json) {
//     return Pets(
//       id: int.parse(json['id']),
//       name: json['name'],
//       group: json['group'],
//       city: json['city'],
//       description: json['description'],
//       gender: json['gender'],
//       photos: json['photos'],
//       ownerNumber: json['owner_number'],
//     );
//   }
// }
