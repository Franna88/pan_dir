class UserModel {
  final String firstName;
  final String surname;
  final DateTime dateAdded;
  final String email;
  final String status;
  final String cell;
  final String id;

  UserModel(
      {required this.firstName,
      required this.surname,
      required this.dateAdded,
      required this.email,
      required this.status,
      required this.cell,
      required this.id});
}
