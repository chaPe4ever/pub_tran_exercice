import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pub_tran_exercise/core/contracts/data/i_search_provider.dart';
import 'package:pub_tran_exercise/core/contracts/general/i_connectivity.dart';
import 'package:pub_tran_exercise/core/models/locations_entity.dart';
import 'package:pub_tran_exercise/core/models/search_entity.dart';
import 'package:pub_tran_exercise/globals/constants.dart';

import 'base_controller.dart';

class HomeController extends SuperController with BaseController {
  // Fields
  IConnectivity _connectivityService;
  ISearchProvider _searchProviderService;
  List<LocationsEntity> _locations;
  List<LocationsEntity> _recentLocationsPicked;
  FloatingSearchBarController _customFloatingSearchBarController;
  GetStorage _box;
  List<LocationsEntity> _locationsHistory;
  Rx<LocationsEntity> _locationPicked;

  // Getters
  List<LocationsEntity> get locations => _locations;
  FloatingSearchBarController get customFloatingSearchBarController =>
      _customFloatingSearchBarController;
  LocationsEntity get locationPicked => _locationPicked.value;

  // Setters

  // Initialisation - LifeCycle
  @override
  void onInit() async {
    isBusy = true;
    super.onInit();
    try {
      _box = GetStorage();
      // Erase to prevent a potential bug
      _box.erase();
      _connectivityService = Get.find();
      _searchProviderService = Get.find();
      _locations = <LocationsEntity>[].obs;
      _recentLocationsPicked = <LocationsEntity>[];
      _customFloatingSearchBarController = FloatingSearchBarController();
      _locationPicked = LocationsEntity().obs;
      _populateSavedHistoryIfAny();

      // Listen to connection changes
      // _connectivityService.connectionStatusController?.stream
      //     .listen((enumConnectivityStatus) {
      //   print(enumConnectivityStatus.toString());
      // });
    } catch (e) {
      printError(info: e.toString());
    } finally {
      isBusy = false;
    }
  }

  @override
  void onDetached() {
    printInfo(info: 'onDetached');
  }

  @override
  void onInactive() {
    printInfo(info: 'onInactive');
  }

  @override
  void onPaused() {
    printInfo(info: 'onPaused');
  }

  @override
  void onResumed() {
    printInfo(info: 'onResumed');
  }

  @override
  void onClose() {
    _customFloatingSearchBarController.dispose();
    super.onClose();
  }

  // Methods
  Future<void> onQueryChanged(String query) async {
    try {
      if (await _connectivityService.isConnected) {
        isBusy = true;

        if (query.isNotEmpty) {
          SearchEntity searchResult = await _searchProviderService
              .getSearchResultsBySearchingText(searchingText: query);

          if (searchResult.locations.isNotEmpty) {
            _locations.clear();
            _locations.addAll(searchResult.locations);
          }
        } else {
          // Add suggestions
          if (customFloatingSearchBarController.isOpen) {
            _locations.clear();
            _locations.addAll(_recentLocationsPicked);
          }
        }
      } else {
        // Popup message about connection lost
        Get.snackbar(kConnectionError, kConnectionMsg);
      }
    } catch (e) {
      printError(info: e.toString());
    } finally {
      isBusy = false;
    }
  }

  Future<void> onLocationListItemTap(LocationsEntity location) async {
    try {
      isBusy = true;
      customFloatingSearchBarController.clear();
      customFloatingSearchBarController.close();

      // Keep around 6 last picks as history list
      _populateSavedHistoryIfAny();
      await _addLocationToHistory(location);

      _populateSavedHistoryIfAny();
      if (_locationsHistory != null) {
        _locations.clear();
        _locations.addAll(_locationsHistory.reversed);
      }

      _locationPicked.value = location;

      // Populate the card to show on home view
    } catch (e) {
      printError(info: e.toString());
    } finally {
      isBusy = false;
    }
  }

  void onClearButtonTapped() {
    _locationPicked.value = LocationsEntity();
  }

  // private methods
  Future<void> _addLocationToHistory(LocationsEntity location) async {
    bool isQueryInList =
        _locationsHistory.any((element) => element.name == location.name);

    location.inHistory = true;

    if (_locationsHistory.length > 5) {
      if (!isQueryInList) {
        _locationsHistory.add(location);
        _locationsHistory.removeAt(0);
        await _box.write(kLocationsHistory, _locationsHistory);
      }
    } else {
      if (!isQueryInList) {
        _locationsHistory.add(location);
        await _box.write(kLocationsHistory, _locationsHistory);
      }
    }
  }

  void _populateSavedHistoryIfAny() {
    var savedHistory = _box.read(kLocationsHistory) ?? <LocationsEntity>[];
    _locationsHistory = <LocationsEntity>[];

    _locationsHistory.addAll(savedHistory);
  }
}
