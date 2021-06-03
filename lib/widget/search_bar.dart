import 'package:flutter/cupertino.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final IconData prefix;

  SearchBar({Key? key, this.prefix = CupertinoIcons.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoTextField(
        padding: const EdgeInsets.all(10.0),
        keyboardType: TextInputType.text,
        decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(20.0)),
        cursorColor: CupertinoColors.black,
        prefix: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(
            prefix,
            color: CupertinoColors.systemGrey4,
          ),
        ),
        placeholder: 'Search Pokemon here',
        controller: _textEditingController,
      ),
    );
  }
}
