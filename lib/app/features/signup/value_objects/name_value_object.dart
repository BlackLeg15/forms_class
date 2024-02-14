class NameValueObject {
  final String value;

  const NameValueObject(this.value);

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
