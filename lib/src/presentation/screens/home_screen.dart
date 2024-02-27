import 'package:flutter/material.dart';
import 'package:calculator_app/src/core/constants/app_colors.dart';
import 'package:calculator_app/src/presentation/widget/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculator_app/src/logic/home_cubit.dart';

import '../../service/calculator_logic_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Calculator app",
          style: theme.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: HomeScreenContent(),
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final service = CalculatorService();
    final size = MediaQuery.of(context).size;

    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Text(
                    state.answerNumber,
                    style: theme.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 25, left: 20),
                  child: Text(
                    state.countNumber.isEmpty ? "0" : state.countNumber,
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(flex: 1),
                SizedBox(height: size.height * 0.010),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: GridView.builder(
                      reverse: false,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisExtent: 80,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: service.getList.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return CustomButton(
                            isSelected: homeCubit.isSelected,
                            buttonColor: Colors.red,
                            textColor: AppColors.whiteColor,
                            text: service.getList[index],
                            buttonPressed: () =>
                                homeCubit.addToExpression('ans'),
                          );
                        } else if (index == 1) {
                          return CustomButton(
                            isSelected: homeCubit.isSelected,
                            textColor: Colors.white,
                            buttonColor: AppColors.redColor,
                            text: service.getList[index],
                            buttonPressed: () => homeCubit.clear(),
                          );
                        } else if (index == 2) {
                          return CustomButton(
                            isSelected: homeCubit.isSelected,
                            textColor: Colors.white,
                            buttonColor: service
                                .switchButtonColor(service.getList[index])
                                ? AppColors.buttonBlueColor
                                : Colors.grey.shade300,
                            text: service.getList[index],
                            buttonPressed: () => homeCubit.equalToFunction(),
                          );
                        } else if (index == service.getList.length - 1) {
                          return CustomButton(
                            isSelected: homeCubit.isSelected,
                            text: service.getList[index],
                            textColor: AppColors.whiteColor,
                            buttonColor: AppColors.buttonBlueColor,
                            buttonPressed: () => homeCubit.equalToFunction(),
                          );
                        } else if (index == service.getList.length - 2) {
                          return CustomButton(
                            isSelected: homeCubit.isSelected,
                            textColor: Colors.black,
                            buttonColor: Colors.grey.shade300,
                            text: service.getList[index],
                            buttonPressed: () => homeCubit.removeLast(),
                          );
                        }
                        return CustomButton(
                          isSelected: homeCubit.isSelected,
                          textColor:
                          service.switchButtonColor(service.getList[index])
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                          buttonColor:
                          service.switchButtonColor(service.getList[index])
                              ? AppColors.buttonBlueColor
                              : Colors.grey.shade300,
                          text: service.getList[index],
                          buttonPressed: () =>
                              homeCubit.addToExpression(service.getList[index]),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SizedBox();
      },
    );
  }
}
