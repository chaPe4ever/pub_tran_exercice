import 'package:mockito/mockito.dart';
import 'package:pub_tran_exercise/core/services/data/search_provider_service.dart';
import 'package:pub_tran_exercise/core/services/general/api_auth_provider_service.dart';
import 'package:pub_tran_exercise/core/services/general/connectivity_service.dart';

class ApiAuthProviderServiceMock extends Mock
    implements ApiAuthProviderService {}

class ConnectivityServiceMock extends Mock implements ConnectivityService {}

class SearchProviderServiceMock extends Mock implements SearchProviderService {}
