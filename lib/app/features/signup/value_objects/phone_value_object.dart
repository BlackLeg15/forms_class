class PhoneValueObject {
  final String value;
  final String maskedValue;

  const PhoneValueObject(this.value, this.maskedValue);

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (value.length < 11) {
      return 'Digite um telefone válido';
    }

    return null;
  }
}
