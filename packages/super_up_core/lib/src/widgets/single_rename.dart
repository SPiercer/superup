import 'package:flutter/material.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class SingleRename extends StatefulWidget {
  final String appbarTitle;
  final String subTitle;
  final String? oldValue;

  const SingleRename(
      {Key? key,
      required this.appbarTitle,
      required this.subTitle,
      this.oldValue})
      : super(key: key);

  @override
  State<SingleRename> createState() => _SingleRenameState();
}

class _SingleRenameState extends State<SingleRename> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.oldValue != null) {
      controller.text = widget.oldValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: widget.appbarTitle.text,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: true,
                  controller: controller,
                  decoration: InputDecoration(hintText: widget.appbarTitle),
                ),
                const SizedBox(
                  height: 20,
                ),
                widget.subTitle.text
              ],
            ),
            Column(
              children: [
                const Divider(
                  height: 1,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            context.pop(controller.text);
                          },
                          child: "Cancel".text,
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 1,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            context.pop(controller.text);
                          },
                          child: "Ok".text,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
