import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// import '../../../../models/chargestations_model.dart';
import '../../../../services/api_service.dart';
import '../../../models/chargestations_model.dart';
import '../../../services/credentials_loader.dart';

part 'chargestations_event.dart';
part 'chargestations_state.dart';

class ChargestationsBloc
    extends Bloc<ChargestationsEvent, ChargestationsState> {
  ChargestationsBloc() : super(ChargestationsInitial()) {
    // final ApiService apiDomain;
    final Credentials credentials;

    on<ChargestationsEvent>((event, emit) {
      // TODO: implement event handler

      // apiDomain.fetchChargestations();
    });
  }
}
