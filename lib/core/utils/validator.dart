import 'package:flutter/material.dart';

enum ValidatorType {
  notEmpty('Утга оруулна уу'),
  amount('Мөнгөн дүн буруу'),
  decimal('Утга буруу'),
  phone('Зөв дугаар оруулна уу'),
  email('И-мэйл хаяг буруу'),
  age('Насны утга буруу'),
  registerNumber('Регистрийн дугаар буруу'),
  cyrillic('Кирил тэмдэгт биш байна'),
  pin('4 оронтой тоо оруулна уу'),
  noSpecialChar('Тусгай тэмдэгт агуулсан байна'),
  password('Нууц үг хамгийн багадаа 8 тэмдэгт');

  const ValidatorType(this.errorText);
  final String errorText;
}

class Validator {
  Validator({required this.validations});

  final List<ValidatorType> validations;

  (bool, String?) isValid(String text) {
    for (final validation in validations) {
      if (_isValid(validation, text) == false) {
        return (false, validation.errorText);
      }
    }
    return (true, null);
  }

  bool _isValid(ValidatorType type, String text) {
    String pattern;
    switch (type) {
      case ValidatorType.notEmpty:
        pattern = r'^(?!\s*$).+';
        break;
      case ValidatorType.amount:
        pattern = r'^[1-9][0-9]*$';
        break;
      case ValidatorType.decimal:
        pattern = r'^[0-9]*\.?[0-9]+$';
        break;
      case ValidatorType.phone:
        pattern = r'^[6-9]{1}[0-9]{7}$';
        break;
      case ValidatorType.age:
        pattern = r'^[0-9]{1,3}$';
        break;
      case ValidatorType.email:
        pattern =
            r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]{2,50}@[a-zA-Z0-9._-]+(?!.*\\.\\.)\.[a-zA-Z]{2,64}";
        break;
      case ValidatorType.registerNumber:
        pattern =
            r'^[0-9]{2}(1[0-2]|0[1-9]|2[1-9]|3[0-2])(0[1-9]|[1-2][0-9]|3[0-1])[0-9]{2}$';
        break;
      case ValidatorType.cyrillic:
        pattern = r'^[а-яА-ЯөүӨҮёЁ-]{1,50}$';
        break;
      case ValidatorType.pin:
        pattern = r'^[0-9]{4}$';
        break;
      case ValidatorType.noSpecialChar:
        pattern = r'^[^!<>|&]+$';
        break;
      case ValidatorType.password:
        pattern = r'^.{8,}$';
        break;
    }
    final regex = RegExp(pattern);
    return regex.hasMatch(text);
  }

  void setValidation({
    required TextEditingController controller,
    required ValueNotifier<String?> errorNotifier,
  }) {
    controller.addListener(() {
      final valid = isValid(controller.text);
      errorNotifier.value = valid.$2;
    });
  }
}
