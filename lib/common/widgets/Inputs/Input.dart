import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Icon/IconButton.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/theme/styles/inputs.dart';
import 'package:tproject/util/validator/validator.dart';

enum InputCounterOptions { show, hide, showOnEnd }

class UIInput extends StatefulWidget {
  const UIInput(
    this.label,
    this.value, {
    super.key,
    this.validate,
    this.styles,
    this.isPlaceholder = false,
    this.autofocus = false,
    this.padding,
    this.onSubmit,
    this.onChange,
    this.type = TextInputType.text,
    this.prefixIcon,
    this.prefixIconStyles,
    this.maxLength,
    this.counterOptions = InputCounterOptions.hide,
    this.suffixIcon,
    this.minLines,
    this.maxLines,
    this.textAreaIsInfinity = false,
    this.mask,
    this.isPassword = false,
  });

  final String label;
  final TextEditingController value;
  final List<Function(String?)?>? validate;
  final bool autofocus, isPlaceholder, isPassword;
  final Function(bool)? styles;
  final EdgeInsets? padding;
  final Function()? onSubmit;
  final Function(String)? onChange;
  final TextInputType type;
  final String? prefixIcon;
  final TextStyle? prefixIconStyles;
  final int? maxLength;
  final InputCounterOptions counterOptions;
  final Widget? suffixIcon;
  final int? minLines, maxLines;
  final bool textAreaIsInfinity;
  final TextInputFormatter? mask;

  @override
  UIInputState createState() => UIInputState();
}

class UIInputState extends State<UIInput> {
  String error = '';
  String counter = '';
  bool showPassword = false;
  bool isNotEmpty = false;

  @override
  void initState() {
    super.initState();

    // isNotEmpty
    if (widget.isPassword) {
      widget.value.addListener(() {
        setState(() {
          isNotEmpty = widget.value.text.isNotEmpty;
        });
      });
    }

    // Counter
    if (widget.maxLength != null && widget.counterOptions != InputCounterOptions.hide) {
      widget.value.addListener(() {
        final maxLength = widget.maxLength ?? 0;
        final currentLength = widget.value.text.length;

        setState(() {
          int remaining = maxLength - currentLength;

          // Show on end
          if (widget.counterOptions == InputCounterOptions.showOnEnd && remaining <= 5) {
            counter = '$currentLength / $maxLength';
          }
          // Always show
          else if (widget.counterOptions == InputCounterOptions.show) {
            counter = '$currentLength / $maxLength';
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    InputDecorationTheme inputStyles = widget.styles?.call(error.isNotEmpty) ?? TInputsThemes.inputTheme(error.isNotEmpty);
    TextStyle inputPrefixIconStyles = widget.prefixIconStyles ?? TextStyle(fontSize: 18, color: TColors.primary.withValues(alpha: 0.5));

    // Input ----------------
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.value,

          // Validation
          validator: (value) {
            String? errors = TValidator.validate(value, widget.validate);
            setState(() => error = errors ?? '');
            return errors;
          },

          // onChange
          onChanged: widget.onChange,
          // onSubmit
          onFieldSubmitted: widget.onSubmit != null ? (value) => widget.onSubmit!() : null,
          // autofocus
          autofocus: widget.autofocus,

          // Type
          keyboardType: widget.type,

          // MaxLength
          maxLength: widget.maxLength ?? 255,

          // Textarea options
          minLines: widget.minLines ?? 1,
          maxLines: widget.textAreaIsInfinity
              ? null
              : widget.minLines != null && widget.maxLines == null
                  ? widget.minLines
                  : widget.maxLines ?? 1,

          // Hide text
          obscureText: widget.isPassword && !showPassword,

          // Mask
          inputFormatters: widget.mask != null ? [widget.mask!] : [],

          style: const TextStyle(fontSize: 16, color: TColors.black),

          // Styles
          decoration: InputDecoration(
            isDense: true,
            counterText: '',

            // Label
            labelText: widget.isPlaceholder ? null : widget.label,
            hintText: widget.isPlaceholder ? widget.label : null,

            // Padding
            contentPadding: widget.padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24),

            // Background
            filled: true,
            fillColor: inputStyles.fillColor,

            // Label styles
            labelStyle: inputStyles.labelStyle,
            floatingLabelStyle: inputStyles.floatingLabelStyle,

            // Placeholder styles
            hintStyle: inputStyles.hintStyle,

            // Borders
            enabledBorder: inputStyles.enabledBorder,
            focusedBorder: inputStyles.focusedBorder,
            errorBorder: inputStyles.enabledBorder,
            focusedErrorBorder: inputStyles.focusedBorder,

            // Errors styles
            errorStyle: const TextStyle(height: 0, fontSize: 0),

            // Icons
            prefixIcon: widget.prefixIcon != null ? UIIcon(widget.prefixIcon!, styles: inputPrefixIconStyles) : null,
            suffixIcon:
                // Password button
                widget.isPassword && isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UIIconButton(
                          TIcons.password,
                          () => setState(() => showPassword = !showPassword),
                          radius: TStyles.radius,
                          styles: TextStyle(fontSize: 18, color: TColors.primary.withValues(alpha: 0.5)),
                        ),
                      )

                    // SuffixIcon
                    : widget.suffixIcon != null
                        ? Padding(padding: const EdgeInsets.all(8.0), child: widget.suffixIcon)
                        : null,
          ),
        ),

        // Errors and counter
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Errors
            error.isNotEmpty
                ? Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 6, right: counter.isNotEmpty ? 10 : 0),
                      child: UIText(error, styles: inputStyles.errorStyle),
                    ),
                  )
                : Container(),

            // Counter
            if (counter.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 8, left: 10),
                child: UIText(counter, styles: const TextStyle(fontSize: 12)),
              ),
          ],
        ),
      ],
    );
  }
}
