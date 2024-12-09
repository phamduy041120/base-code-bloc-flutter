import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/app_text_styles.dart';
import '../../resources/gen/colors.gen.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    this.textEditingController,
    this.height,
    this.title,
    this.hintText,
    this.onChanged,
    this.onValidated,
    this.onFocused,
    this.onEditingComplete,
    this.inputFormatters,
    this.textInputType = TextInputType.text,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.done,
    this.autocorrect = true,
    this.isPasswordField = false,
    this.isShowTagRequired = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.filledColor = Colors.transparent,
    this.borderColor = ColorName.grayCCCCCC,
    this.borderWidth = 1,
    this.titleColor = ColorName.gray666666,
    this.cursorColor = ColorName.gray666666,
    this.inputStyle,
    this.suffixIcon,
    this.errorText,
    super.key,
  });

  final double? height;

  final String? title;

  final String? hintText;

  final ValueChanged<String>? onChanged;

  final VoidCallback? onValidated;

  final VoidCallback? onFocused;

  final VoidCallback? onEditingComplete;

  final ValueChanged<String>? onFieldSubmitted;

  final List<TextInputFormatter>? inputFormatters;

  final TextInputType? textInputType;

  final TextInputAction? textInputAction;

  final bool autocorrect;

  final bool isPasswordField;

  final bool isShowTagRequired;

  final int? minLines;

  final int? maxLines;

  final Color filledColor;

  final Color borderColor;

  final Color titleColor;

  final Color cursorColor;

  final double borderWidth;

  final TextStyle? inputStyle;

  final TextEditingController? textEditingController;

  final Widget? suffixIcon;

  final String? errorText;

  @override
  State<StatefulWidget> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  var obscureText = true;

  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        widget.onFocused?.call();
      } else {
        widget.onValidated?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title ?? '',
                style: AppTextStyles.s16w400.copyWith(
                  color: widget.titleColor,
                ),
              ),
              const SizedBox(height: 8)
            ],
          ),
        Container(
          width: double.infinity,
          height: 46,
          decoration: BoxDecoration(
            color: widget.filledColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color:
                  widget.errorText == null ? widget.borderColor : ColorName.red,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: focusNode,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                controller: widget.textEditingController,
                textInputAction: widget.textInputAction,
                keyboardType: widget.textInputType,
                onFieldSubmitted: widget.onFieldSubmitted,
                style: widget.inputStyle ??
                    AppTextStyles.s14w400.copyWith(color: ColorName.gray1A1A1A),
                cursorColor: widget.cursorColor,
                obscureText: obscureText && widget.isPasswordField,
                autocorrect: widget.autocorrect,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  hintText: widget.hintText,
                  hintStyle: AppTextStyles.s14w400.copyWith(
                    color: ColorName.grayCCCCCC,
                  ),
                  suffixIcon: widget.isPasswordField
                      ? buildPasswordSuffixIcon()
                      : widget.suffixIcon,
                  suffixIconConstraints:
                      const BoxConstraints(maxHeight: 46, minWidth: 40),
                ),
                onChanged: (value) {
                  widget.onChanged?.call(value);
                },
                onEditingComplete: () {
                  widget.onEditingComplete?.call();
                },
                inputFormatters: widget.inputFormatters,
              ),
            ],
          ),
        ),
        if (widget.errorText?.isNotEmpty ?? false) _buildErrorText(),
      ],
    );
  }

  Widget _buildErrorText() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        widget.errorText!,
        style: AppTextStyles.s12w400.copyWith(color: ColorName.red),
      ),
    );
  }

  Widget buildPasswordSuffixIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      child: SizedBox(
        width: 24,
        height: 24,
        child: Text('aa'),
        // child: obscureText
        //     ? Assets.icons.eye.svg(fit: BoxFit.scaleDown)
        //     : Assets.icons.eyeOff.svg(fit: BoxFit.scaleDown),
      ),
    );
  }
}
