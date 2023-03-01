import 'package:flutter/material.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class SingleRename extends StatefulWidget {
  final String appbarTitle;

  final String? oldValue;

  const SingleRename({
    super.key,
    required this.appbarTitle,
    this.oldValue,
  });

  @override
  State<SingleRename> createState() => _SingleRenameState();
}

class _SingleRenameState extends State<SingleRename> {
  final controller = TextEditingController();

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
      body: SafeArea(
        child: Padding(
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
