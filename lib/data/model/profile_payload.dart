// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:collection';

class ProfilePayload extends MapView<String, dynamic> {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String city;
  final String shippingAddress;

  ProfilePayload(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.city,
      required this.shippingAddress})
      : super({
          "firstName": firstName,
          "lastName": lastName,
          "mobile": phoneNumber,
          "city": city,
          "shippingAddress": shippingAddress
        });
}
