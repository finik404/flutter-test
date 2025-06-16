import 'package:tproject/common/widgets/Inputs/Input.dart';

class UITextArea extends UIInput {
  const UITextArea(
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
    super.suffixIcon,
    super.prefixIconStyles,
    super.maxLength,
    super.maxLines,
    super.textAreaIsInfinity,
    super.counterOptions,
  }) : super(minLines: 2);
}
