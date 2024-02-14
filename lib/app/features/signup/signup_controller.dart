import 'package:flutter/foundation.dart';
import 'package:forms_class/app/features/signup/signup_view_model.dart';
import 'package:forms_class/app/features/signup/value_objects/email_value_object.dart';
import 'package:forms_class/app/features/signup/value_objects/name_value_object.dart';
import 'package:forms_class/app/features/signup/value_objects/phone_value_object.dart';

class SignupController extends ChangeNotifier {
  SignupViewModel viewModel = const SignupViewModel(
    email: EmailValueObject(''),
    name: NameValueObject(''),
    phone: PhoneValueObject('', ''),
    isAdult: false,
  );

  String? nameErrorMessage;
  String? phoneErrorMessage;

  void updateNameErrorMessage(String? message) {
    nameErrorMessage = message;
    notifyListeners();
  }

  void updatePhoneErrorMessage(String? message) {
    phoneErrorMessage = message;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    viewModel = viewModel.copyWith(email: EmailValueObject(newEmail));
    notifyListeners();
  }

  void updateName(String newName) {
    viewModel = viewModel.copyWith(name: NameValueObject(newName));
    notifyListeners();
  }

  void updatePhone(String newPhone, String maskedValue) {
    viewModel = viewModel.copyWith(phone: PhoneValueObject(newPhone, maskedValue));
    notifyListeners();
  }

  void updateIsAdult(bool value) {
    viewModel = viewModel.copyWith(isAdult: value);
    notifyListeners();
  }
}
