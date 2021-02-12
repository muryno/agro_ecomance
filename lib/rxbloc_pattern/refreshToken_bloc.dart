




import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:rxdart/rxdart.dart';

class UserProfileBloc {

  final apiProvider = RetrofitClientInstance.getInstance();
  final _userProfileBloc= PublishSubject<UserProfile>();
  Stream< UserProfile> get allUserProfile=> _userProfileBloc.stream;




  getProfile() async{
    UserProfile item = await apiProvider.getDataService().getUserProfile();
   // StorageUtil.saveProfileUser(item.data);
    _userProfileBloc.sink.add(item);
  }




  dispose() {
    _userProfileBloc.drain();

  }
}

final userProfileBloc = UserProfileBloc();