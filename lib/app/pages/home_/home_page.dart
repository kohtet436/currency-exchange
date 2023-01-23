import 'package:currency_exchange/app/pages/home_/home_page_controller.dart';
import 'package:currency_exchange/app/themes/themes.dart';
import 'package:currency_exchange/app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Currency Exchange"),
      ),
      body: Obx(
        () => SafeArea(
            child: controller.isLoading
                ? const LoadingWidget()
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: controller.mmkForm,
                      child: ListView(children: [
                        Row(
                          children: [
                            const Text(
                              "Latest Update :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              controller
                                  .formatTimestamp(controller.rate?.timeStamp),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 7, 24, 120),
                            ),
                            alignment: Alignment.center,
                            height: 100,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Today Exchange:",
                                  style: Themes.textStyle,
                                ),
                                controller.dropvalue != ""
                                    ? Text(
                                        " 1 ${controller.dropvalue} = ${controller.rate?.rates[controller.dropvalue]} MMK",
                                        style: Themes.textStyle,
                                      )
                                    : const Text("")
                              ],
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            keyboardAppearance: Brightness.dark,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (_) =>
                                _?.isEmpty == true ? "Requried" : null,
                            cursorColor: Colors.indigo,
                            keyboardType: TextInputType.number,
                            controller: controller.textController,
                            decoration: Themes.inputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        DecoratedBox(
                          decoration: Themes.dropdownDecoration,
                          child: DropdownButton<dynamic>(
                            alignment: Alignment.center,
                            elevation: 0,
                            iconSize: 30,
                            hint: const Text(
                              "select",
                              style: Themes.dropDownItemtextStyle,
                            ),
                            isExpanded: true,
                            value: controller.dropvalue.isNotEmpty
                                ? controller.dropvalue
                                : null,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.indigo,
                            ),
                            items: controller.rate?.rates != null
                                ? controller.rate?.rates.entries
                                    .map((e) => DropdownMenuItem(
                                        alignment: Alignment.center,
                                        value: e.key,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            //                    <-- BoxDecoration
                                            border:
                                                Border(bottom: BorderSide()),
                                          ),
                                          child: ListTile(
                                              dense: true,
                                              title: Text(
                                                e.key.toString(),
                                                style: Themes
                                                    .dropDownItemtextStyle,
                                              )),
                                        )))
                                    .toList()
                                : [
                                    const DropdownMenuItem(
                                        value: "Empty", child: Text("Empty"))
                                  ],
                            onChanged: (var newValue) {
                              controller.dropvalue = newValue;
                              print('select=>$newValue');
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(23.0),
                                  ),
                                ),
                                onPressed: () {
                                  controller.convertMoney(controller
                                      .rate?.rates[controller.dropvalue]);
                                },
                                child: const Text(
                                  "convert",
                                  style: TextStyle(fontSize: 20),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Card(
                          elevation: 9,
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Your Result is : ",
                                  style: Themes.textStyle.copyWith(
                                      color: Colors.red, fontSize: 20),
                                ),
                                Text(
                                  "${controller.answer.toStringAsFixed(2)}  ${controller.dropvalue}",
                                  style: Themes.textStyle.copyWith(
                                      color: Colors.red, fontSize: 22),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                    ),
                  )),
      ),
    );
  }
}
