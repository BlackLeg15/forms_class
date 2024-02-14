class EmailValueObject {
  final String value;

  const EmailValueObject(this.value);

  bool validate() => value.contains('@');
}
