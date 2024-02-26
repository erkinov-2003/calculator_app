import 'package:calculator_app/src/core/constants/app_colors.dart';
import 'package:calculator_app/src/presentation/widget/custom_button.dart';
import 'package:calculator_app/src/service/calculator_logic_service.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var countNumber = "";
  var answerNumber = "";
  final service = CalculatorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(
                answerNumber,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, top: 20),
              child: Text(
                countNumber,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 80,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: service.getList.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return CustomButton(
                        buttonColor: Colors.grey,
                        text: service.getList[index],
                        buttonPressed: () {
                          setState(() {
                            countNumber = "";
                          });
                        },
                      );
                    } else if (index == 1) {
                      return CustomButton(
                        buttonColor: Colors.grey,
                        text: service.getList[index],
                        buttonPressed: () {
                          setState(() {
                            countNumber = countNumber.substring(
                                0, countNumber.length - 1);
                          });
                        },
                      );
                    } else if (index == 2) {
                      return CustomButton(
                        buttonColor: Colors.grey,
                        text: service.getList[index],
                        buttonPressed: equalToFunction,
                      );
                    } else if (index == service.getList.length - 1) {
                      return CustomButton(
                        buttonColor: Colors.grey,
                        text: service.getList[index],
                        buttonPressed: () {
                          equalToFunction();
                          setState(() {});
                        },
                      );
                    }
                    return CustomButton(
                      buttonColor:
                          service.switchButtonColor(service.getList[index])
                              ? Colors.blue
                              : Colors.white,
                      text: service.getList[index],
                      buttonPressed: () {
                        setState(() {
                          countNumber += service.getList[index];
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalToFunction() {
    try {
      var question = countNumber;
      question = question.replaceAll("x", "*");
      Parser prs = Parser();
      Expression expression = prs.parse(question);
      ContextModel contextModel = ContextModel();
      double numbers = expression.evaluate(EvaluationType.REAL, contextModel);
      setState(() {
        answerNumber = numbers.toString();
      });
    } catch (e) {
      setState(() {
        answerNumber = "Error";
      });
    }
  }
}
