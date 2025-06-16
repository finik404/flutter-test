import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';

class UIPhoneInput extends UIInput {
  UIPhoneInput(
    super.label,
    super.value, {
    super.key,
    super.validate,
    super.padding,
    super.isPlaceholder,
    super.autofocus,
    super.onSubmit,
    super.onChange,
    super.prefixIcon,
    super.prefixIconStyles,
    super.suffixIcon,
  }) : super(
          type: TextInputType.phone,
          mask: TextInputMask(mask: '\\+7 999 999 99 99'),
        );
}
