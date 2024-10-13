
import 'package:my_app_1/app/app.bottomsheets.dart';
import 'package:my_app_1/app/app.dialogs.dart';
import 'package:my_app_1/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	List<Map<String, dynamic>> _sp500Metrics = [];
	List<Map<String, dynamic>> get sp500Metrics => _sp500Metrics;

	void fetchSP500Metrics() {
		// Mock data for S&P 500 metrics
		_sp500Metrics = [
			{'symbol': 'AAPL', 'price': 150.00, 'change': '+1.5%'},
			{'symbol': 'GOOGL', 'price': 2800.50, 'change': '+2.0%'},
			{'symbol': 'AMZN', 'price': 3400.20, 'change': '-0.5%'},
		];
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'S&P 500 Metrics',
			description: 'Displaying mock data for S&P 500 metrics.',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Notice',
			description: 'This is a notice for S&P 500 metrics.',
		);
	}
}
