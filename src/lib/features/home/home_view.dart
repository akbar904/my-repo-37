
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
	const HomeView({super.key});

	@override
	Widget builder(
		BuildContext context,
		HomeViewModel viewModel,
		Widget? child,
	) {
		return Scaffold(
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.symmetric(horizontal: 25),
					child: Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.spaceAround,
							children: [
								const Gap(50),
								const Text(
									'S&P 500 Metrics',
									style: TextStyle(
										fontSize: 35,
										fontWeight: FontWeight.w900,
									),
								),
								const Gap(25),
								Expanded(
									child: ListView.builder(
										itemCount: viewModel.sp500Metrics.length,
										itemBuilder: (context, index) {
											final metric = viewModel.sp500Metrics[index];
											return Card(
												child: ListTile(
													title: Text(metric.name),
													subtitle: Text('Value: ${metric.value}'),
												),
											);
										},
									),
								),
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: [
										MaterialButton(
											color: Colors.grey,
											onPressed: viewModel.showDialog,
											child: const Text(
												'Show Dialog',
												style: TextStyle(
													color: Colors.white,
												),
											),
										),
										MaterialButton(
											color: Colors.grey,
											onPressed: viewModel.showBottomSheet,
											child: const Text(
												'Show Bottom Sheet',
												style: TextStyle(
													color: Colors.white,
												),
											),
										),
									],
								),
							],
						),
					),
				),
			),
		);
	}

	@override
	HomeViewModel viewModelBuilder(
		BuildContext context,
	) => HomeViewModel();
}
