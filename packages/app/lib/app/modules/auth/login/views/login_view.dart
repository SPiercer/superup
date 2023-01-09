import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/constants/app_constants.dart';
import 'package:textless/textless.dart';

import '../../../../core/constants/colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: 'Enter your phone number'.h4.size(22),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                "${AppConstants.appName} will need to verify your phone number."
                    .b1
                    .alignCenter,
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * .13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: CountryListPick(
                              initialSelection: controller.countryCode,
                              useSafeArea: true,
                              theme: CountryTheme(
                                isShowFlag: false,
                                isShowTitle: true,
                                isShowCode: false,
                                isDownIcon: true,
                                showEnglishName: true,
                              ),
                              onChanged: (value) {
                                if (value != null) {
                                  controller.countryCode = value.dialCode!;
                                }
                              },
                            ),
                          ),
                          // const Icon(
                          //   Icons.arrow_drop_down_outlined,
                          //   color: AppColors.primaryColor,
                          // )
                        ],
                      ),
                      const Divider(
                        height: 10,
                        thickness: 1,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  hintText: "+    ${controller.countryCode.split("+").last}"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 3,
                            child: TextField(
                              autofocus: true,
                              controller: controller.phoneTextController,
                              decoration: const InputDecoration(
                                  hintText: "phone number"),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      "No carrier charges will be applied".text
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  controller.nextPress();
                },
                child: "Next".toUpperCase().text,
              ),
            )
          ],
        ),
      ),
    );
  }
}
