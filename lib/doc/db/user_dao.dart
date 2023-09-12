import 'package:doc_on_call_24_7_mobile/entity/user_general.dart';
import 'package:floor/floor.dart';


@dao
abstract class UserDao{
    @Query("select * from user_entity")
    Future<UserGeneral> getUserRecord();

    @Insert(onConflict: OnConflictStrategy.REPLACE)
    Future<void> saveUser(UserGeneral data);



}