// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'value_objects/email_value_object.dart';
import 'value_objects/name_value_object.dart';
import 'value_objects/phone_value_object.dart';

class SignupViewModel {
  final EmailValueObject email;
  final NameValueObject name;
  final PhoneValueObject phone;
  final bool isAdult;

  const SignupViewModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.isAdult,
  });


  SignupViewModel copyWith({
    EmailValueObject? email,
    NameValueObject? name,
    PhoneValueObject? phone,
    bool? isAdult,
  }) {
    return SignupViewModel(
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      isAdult: isAdult ?? this.isAdult,
    );
  }

  @override
  bool operator ==(covariant SignupViewModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.name == name &&
      other.phone == phone &&
      other.isAdult == isAdult;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      isAdult.hashCode;
  }
}
