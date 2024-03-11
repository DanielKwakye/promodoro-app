import 'package:flutter/material.dart';
import 'package:promodo/core/app.colors.dart';

class CustomTextFieldWidget extends StatefulWidget {

  final String? label;
  final String? placeHolder;
  final String? initialValue;
  final bool? readOnly;
  final bool? disabled;
  final void Function()? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final void Function(String?)? onSaved;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Function(bool?)? onFocusChanged;
  final TextInputType? inputType;
  final bool? obscureText;
  final bool? isPassword;
  final bool? isPhone;
  final String? initialPhoneCountryCode;
  final int? maxLines;
  final int? minLines;
  final FocusNode? focusNode;
  final String? errorText;
  final Widget? suffix;
  final TextCapitalization textCapitalization;
  final bool showLabel;
  final Function(String)? onFieldSubmitted;
  final String? subLabel;


  const CustomTextFieldWidget({super.key,
    this.maxLines = 1,
    this.minLines = 1,
    this.initialValue,
    this.readOnly = false,
    this.disabled = false,
    this.onTap,
    this.controller,
    this.validator,
    this.onSaved,
    this.prefixIcon,
    this.prefix,
    this.onChange,
    this.label,
    this.placeHolder,
    this.onFocusChanged,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.isPassword = false,
    this.isPhone = false,
    this.initialPhoneCountryCode,
    this.focusNode,
    this.errorText,
    this.suffix,
    this.textCapitalization = TextCapitalization.sentences,
    this.showLabel = true,
    this.onFieldSubmitted,
    this.subLabel,

  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {

  bool hasReceivedFocus = false;
  final double radius = 5;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    bool readOnly = widget.readOnly!;

    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    if(widget.disabled != null && widget.disabled!){
      readOnly = true;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.inputType,
            initialValue: widget.initialValue,
            readOnly: readOnly,
            focusNode: widget.focusNode,
            textCapitalization: (widget.inputType == TextInputType.emailAddress || widget.isPassword == true) ? TextCapitalization.none : widget.textCapitalization,
            onTap: widget.onTap,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            validator: widget.validator,
            obscureText:  widget.obscureText!,
            onSaved:  widget.onSaved,
            onChanged: widget.onChange,
            cursorColor: theme.brightness == Brightness.light ? theme.colorScheme.outline.withOpacity(0.5) : theme.colorScheme.onBackground,
            onFieldSubmitted: widget.onFieldSubmitted,
            style: TextStyle(color: theme.colorScheme.onBackground),
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              filled: true,
              errorText: widget.errorText,
              fillColor:  (widget.disabled != null && widget.disabled!)? theme.colorScheme.outline.withOpacity(0.2) : theme.brightness == Brightness.dark ? AppColors.raisinBlack : AppColors.azureishWhite.withOpacity(0.5),
              hintText: widget.placeHolder,
              hintStyle: TextStyle(color: theme.colorScheme.onBackground.withOpacity(0.5)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              focusedBorder: OutlineInputBorder(
                borderSide:  const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(radius),
              ),
              border: OutlineInputBorder(
                borderSide:  const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(radius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(radius),
              ),
              suffixIcon:  widget.suffix ,
              prefixIcon: widget.prefixIcon,
              prefix:  widget.prefix,

            ),
          ),
          onFocusChange: (value) {
            setState(() {
              hasReceivedFocus = value;
              if(widget.onFocusChanged != null){
                widget.onFocusChanged!(value);
              }
            });

          },
        ),
        if(widget.subLabel != null && widget.subLabel!.isNotEmpty) ... {
          const SizedBox(height: 5,),
          Text(widget.subLabel ?? '', style: theme.textTheme.titleSmall,)
        }

      ],
    );
  }
}
