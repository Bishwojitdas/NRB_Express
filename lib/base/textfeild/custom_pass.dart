
import 'package:flutter/material.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/dimensions.dart';
import 'package:nrb_express/utill/styles.dart';

class CustomPassField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintTxt;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;


  const CustomPassField({
    this.controller,
    this.hintTxt,
    this.focusNode,
    this.nextNode,
    this.textInputAction
  });

  @override
  _CustomPassFieldState createState() => _CustomPassFieldState();
}

class _CustomPassFieldState extends State<CustomPassField> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorResources.TEXT_FIELD_BG,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: ColorResources.GREY, width: 1),

      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: LatoMedium.copyWith(color: ColorResources.BLACK, fontSize: Dimensions.FONT_SIZE_DEFAULT),
              cursorColor: ColorResources.COLOR_PRIMARY,
              controller: widget.controller,
              obscureText: _obscureText,
              focusNode: widget.focusNode,
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              onFieldSubmitted: (v) {
                setState(() {
                  widget.textInputAction == TextInputAction.done
                      ? FocusScope.of(context).consumeKeyboardToken()
                      : FocusScope.of(context).requestFocus(widget.nextNode);
                });
              },
              validator: (value) {
                return null;
              },
              decoration: InputDecoration(
                // suffixIcon: IconButton(
                //   icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,color: ColorResources.HINT_TEXT_COLOR),
                //   onPressed: _toggle,
                // ),
                hintText: widget.hintTxt ?? '',
                contentPadding: const EdgeInsets.symmetric( horizontal: 25),
                isDense: true,
                hintStyle: LatoBold.copyWith(color: ColorResources.HINT_TEXT_COLOR,fontSize: Dimensions.FONT_SIZE_SMALL),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
          Container(height: 25, width: 1, color: ColorResources.GREY,),
          const SizedBox(width: Dimensions.PADDING_SIZE_SMALL,),
          InkWell(
              onTap: _toggle,
             // child: Image.asset(  _obscureText ? Images.visible_icon : Images.small_icon, height: 20, width: 20,)
          ),
          const SizedBox(width: Dimensions.PADDING_SIZE_SMALL,),
        ],
      ),
    );
  }
}
