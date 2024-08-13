import 'package:delta/DataModel/ArticleM.dart';
import 'package:delta/DataModel/FormsModels/ans_respponse.dart';
import 'package:delta/DataModel/FormsModels/arch_residentialM.dart';
import 'package:delta/DataModel/FormsModels/commerial_designM.dart';
import 'package:delta/DataModel/FormsModels/construction_residenialM.dart';
import 'package:delta/DataModel/FormsModels/contracting_offersM.dart';
import 'package:delta/DataModel/FormsModels/cost_buildM.dart';
import 'package:delta/DataModel/FormsModels/design_nowM.dart';
import 'package:delta/DataModel/FormsModels/engineering_services_offersM.dart';
import 'package:delta/DataModel/FormsModels/general_fixM.dart';
import 'package:delta/DataModel/FormsModels/other_servicesM.dart';
import 'package:delta/DataModel/FormsModels/real_state_investmentM.dart';
import 'package:delta/DataModel/FormsModels/residental_typesM.dart';
import 'package:delta/DataModel/about_usM.dart';
import 'package:delta/DataModel/atricle_cat.dart';
import 'package:delta/DataModel/contact_infoM.dart';
import 'package:delta/DataModel/del_notifyM.dart';
import 'package:delta/DataModel/edit_pro.dart';
import 'package:delta/DataModel/gallery_model.dart';
import 'package:delta/DataModel/home_model.dart';
import 'package:delta/DataModel/introM.dart';
import 'package:delta/DataModel/login_model.dart';
import 'package:delta/DataModel/make_ticket.dart';
import 'package:delta/DataModel/message_sentM.dart';
import 'package:delta/DataModel/notify_detailsM.dart';
import 'package:delta/DataModel/offers_and_dsigns_model.dart';
import 'package:delta/DataModel/order_detailsM.dart';
import 'package:delta/DataModel/order_details_moneyM.dart';
import 'package:delta/DataModel/ordersM.dart';
import 'package:delta/DataModel/profile_infoM.dart';
import 'package:delta/DataModel/project_detailsM.dart';
import 'package:delta/DataModel/projectsM.dart';
import 'package:delta/DataModel/register.dart';
import 'package:delta/DataModel/register_list.dart';
import 'package:delta/DataModel/ticketInfoM.dart';
import 'package:delta/DataModel/tiket_replyM.dart';
import 'package:delta/DataModel/totify_listM.dart';
import 'package:delta/DataModel/user_ticketM.dart';
import 'package:delta/DataModel/user_tickets_listM.dart';
import 'package:dio/dio.dart';


import '../DataModel/FormsModels/set_replayM.dart';

//Intro

class Repository {
  var baseurl = 'https://mdecco.com/app/';
  Dio dio = new Dio();

  Future<SetReplay?> done({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    SetReplay? data;  // Make data nullable
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    try {
      final response = await dio.post(
        baseurl + '/user_api/set_replay',
        data: formData,
      );
      print('done');
      print(response.data);
      data = SetReplay.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      // Handle the error as needed
    }
    return data;
  }
  Future<NotifyListM?> get_Notify({
   required String? key,
   required String? token_id,
   required String? limit,
   required String? page_number,
  }) async {
    NotifyListM? data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "limit": limit,
      "page_number": page_number
    });
    await dio
        .post(
      baseurl + '/pages/get_list_notifications',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = NotifyListM.fromMap(value.data);
    });
    return data;
  }
  //Intro
  Future<IntroM> getIntro({
    required String key,
  }) async {
    IntroM data = IntroM(); // Initialize with a default value
    FormData formData = new FormData.fromMap({
      "key": key,
    });
    try {
      final response = await dio.post(
        baseurl + '/user_api/get_intro',
        data: formData,
      );
      print('done');
      print(response.data);
      data = IntroM.fromMap(response.data);
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
    return data;
  }

  Future<OffersAndDesignsModel> getOffersAndDesigns({
    required String key,
    required String token,
    required String catId,
  }) async {
    OffersAndDesignsModel data = OffersAndDesignsModel(); // Initialize with a default value
    FormData formData = new FormData.fromMap({"key": key, "token_id": token, "cat_id": catId});
    try {
      final response = await dio.post(
        baseurl + '/user_api/types_housing',
        data: formData,
      );
      print(response.data);
      data = OffersAndDesignsModel.fromJson(response.data);
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
    return data;
  }


  Future<OffersAndDesignsModel> getConstructionCosts({
    required String? key,
    required String? token,
    required String? catId,
  }) async {
    try {
      final formData = FormData.fromMap({"key": key, "token_id": token, "cat_id": catId});
      final response = await dio.post(
        '$baseurl/user_api/set_construction_costs',
        data: formData,
      );
      print(response.data);
      return OffersAndDesignsModel.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<RegisterationModel> registerAccount({
    required String? phone,
    required String? key,
    required String? fullname,
    required String? password,
    required String? email,
    required String? address,
    required String? lang,
    required String? firebase_id,
    required String? country,
  }) async {
    try {
      final formData = FormData.fromMap({
        "phone": phone,
        "key": key,
        "password": password,
        "email": email,
        "fullname": fullname,
        "address": address,
        "lang": lang,
        "firebase_id": firebase_id,
        "country": country,
      });
      final response = await dio.post(
        '$baseurl/user_api/set_registration',
        data: formData,
      );
      print('done');
      print(response.data);
      return RegisterationModel.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Register List Country
  Future<RegistrationListM> registerListCountry({
    required String key,
    required String lang,
  }) async {
    try {
      final formData = FormData.fromMap({"key": key, "lang": lang});
      final response = await dio.post(
        '$baseurl/user_api/preparation_registeration',
        data: formData,
      );
      print('done');
      print(response.data);
      return RegistrationListM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Login
  Future<LoginM> loginAccount({
    required String? phone,
    required String? password,
     String? firebase_id,
    required String? key,
  }) async {
    try {
      final formData = FormData.fromMap({
        "phone": phone,
        "password": password,
        "firebase_id": firebase_id,
        "key": key,
      });
      final response = await dio.post(
        '$baseurl/pages/set_login',
        data: formData,
      );
      print('done');
      print(response.data);
      return LoginM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Home
  Future<HomeM> getHome({
    required String token_id,
    required String key,
  }) async {
    try {
      final formData = FormData.fromMap({
        "token_id": token_id,
        "key": key,
      });
      final response = await dio.post(
        '$baseurl/user_api/get_home',
        data: formData,
      );
      print('done');
      print(response.data);
      return HomeM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Article Categories
  Future<ArticleCatM> getArticleCat({
    required String token_id,
    required String key,
  }) async {
    try {
      final formData = FormData.fromMap({
        "token_id": token_id,
        "key": key,
      });
      final response = await dio.post(
        '$baseurl/user_api/get_all_article_categories',
        data: formData,
      );
      print('done');
      print(response.data);
      return ArticleCatM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Contact Info
  Future<ContactInfoM> getContact({
    required String? token_id,
    required String? key,
  }) async {
    try {
      final formData = FormData.fromMap({
        "token_id": token_id,
        "key": key,
      });
      final response = await dio.post(
        '$baseurl/pages/get_contact_info',
        data: formData,
      );
      print('done');
      print(response.data);
      return ContactInfoM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// About App
  Future<AboutUsM> getAboutApp({
    required String token_id,
    required String key,
  }) async {
    try {
      final formData = FormData.fromMap({
        "token_id": token_id,
        "key": key,
      });
      final response = await dio.post(
        '$baseurl/pages/about',
        data: formData,
      );
      print('done');
      print(response.data);
      return AboutUsM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Article
  Future<ArticleM> getArticle({
    required String token_id,
    required String key,
    required String article_id,
  }) async {
    try {
      final formData = FormData.fromMap({
        "token_id": token_id,
        "key": key,
        "article_id": article_id,
      });
      final response = await dio.post(
        '$baseurl/user_api/get_all_articles_details',
        data: formData,
      );
      print('done');
      print(response.data);
      return ArticleM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Get Tickets
  Future<UserTicketsM> getTickets({
    required String token_id,
    required String key,
    required String limit,
    required String page_number,
  }) async {
    try {
      final formData = FormData.fromMap({
        "token_id": token_id,
        "key": key,
        "limit": limit,
        "page_number": page_number,
      });
      final response = await dio.post(
        '$baseurl/pages/tickets',
        data: formData,
      );
      print('done');
      print(response.data);
      return UserTicketsM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Ticket List
  Future<UserTicketsListM> getTicketList({
    required String key,
    required String token,
  }) async {
    try {
      final formData = FormData.fromMap({"key": key, "token_id": token});
      final response = await dio.post(
        '$baseurl/pages/tickets_types',
        data: formData,
      );
      print('done');
      print(response.data);
      return UserTicketsListM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Make Ticket
  Future<MakeTicketM> makeTicket({
    required String key,
    required String token,
    required String ticket_type_id,
    required String? title,
    required String? content,
  }) async {
    try {
      final formData = FormData.fromMap({
        "key": key,
        "token_id": token,
        "ticket_type_id": ticket_type_id,
        "title": title,
        "content": content,
      });
      final response = await dio.post(
        '$baseurl/pages/new_ticket',
        data: formData,
      );
      print('done');
      print(response.data);
      return MakeTicketM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Get Ticket Info
  Future<TicketInfoM> getTicketInfo({
    required String key,
    required String token_id,
    required String ticket_id,
  }) async {
    try {
      final formData = FormData.fromMap({
        "key": key,
        "token_id": token_id,
        "ticket_id": ticket_id,
      });
      final response = await dio.post(
        '$baseurl/pages/ticket',
        data: formData,
      );
      print('done');
      print(response.data);
      return TicketInfoM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Get Notifications
  Future<NotifyListM> getNotifications({
    required String key,
    required String token_id,
    required String limit,
    required String page_number,
  }) async {
    try {
      final formData = FormData.fromMap({
        "key": key,
        "token_id": token_id,
        "limit": limit,
        "page_number": page_number,
      });
      final response = await dio.post(
        '$baseurl/pages/get_list_notifications',
        data: formData,
      );
      print('done');
      print(response.data);
      return NotifyListM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// Get Notification Details
  Future<NotifyDetailsM> getNotifyDetails({
    required String key,
    required String token_id,
    required String? id_notify,
  }) async {
    try {
      final formData = FormData.fromMap({
        "key": key,
        "token_id": token_id,
        "id_notify": id_notify,
      });
      final response = await dio.post(
        '$baseurl/pages/get_notification_details',
        data: formData,
      );
      print('done');
      print(response.data);
      return NotifyDetailsM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }


  // del_Notify
  Future<DeleteNotifyM> delNotify({
    required String key,
    required String token_id,
    required String? id_notfy,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "key": key,
        "token_id": token_id,
        "id_notfy": id_notfy,
      });
      Response response = await dio.post(
        baseurl + '/pages/delete_notification',
        data: formData,
      );
      print('done');
      print(response.data);
      return DeleteNotifyM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// messageSentReply
  Future<MessageSentM> messageSentReply({
    required String key,
    required String token_id,
    required String? name,
    String? phone,
    String? message,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "key": key,
        "token_id": token_id,
        "name": name,
        "phone": phone,
        "message": message,
      });
      Response response = await dio.post(
        baseurl + '/pages/send_message',
        data: formData,
      );
      print('done');
      print(response.data);
      return MessageSentM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// ticketReply
  Future<TicketReplyM> ticketReply({
    required String key,
    required String token_id,
    required String ticket_id,
    required String? content,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "key": key,
        "token_id": token_id,
        "ticket_id": ticket_id,
        "content": content,
      });
      Response response = await dio.post(
        baseurl + '/pages/new_reply',
        data: formData,
      );
      print('done');
      print(response.data);
      return TicketReplyM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// proInfo
  Future<ProfileInfoM> proInfo({
    required String key,
    required String token_id,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "key": key,
        "token_id": token_id,
      });
      Response response = await dio.post(
        baseurl + '/pages/preparation_profile',
        data: formData,
      );
      print('done');
      print(response.data);
      return ProfileInfoM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

// getCostBuildF
  Future<BuildCostM> getCostBuildF({
    required String? key,
    required String? token_id,
    required String? cat_id,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "key": key,
        "token_id": token_id,
        "cat_id": cat_id,
      });
      Response response = await dio.post(
        baseurl + '/user_api/set_commissioning_estimate',
        data: formData,
      );
      print('done');
      print(response.data);
      return BuildCostM.fromMap(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
  Future<BuildCostM> getBuildingCostFinishedKey({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/set_buildingcostfinishKey',
      data: formData,
    );
    print('done');
    print(response.data);
    return BuildCostM.fromMap(response.data);
  }

  // getContractingOffersF
  Future<ContractingOffersM> getContractingOffersF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/set_contracting_offers',
      data: formData,
    );
    print('done');
    print(response.data);
    return ContractingOffersM.fromMap(response.data);
  }

  // getEngineeringServicesF
  Future<EngineeringServicesOffersM> getEngineeringServicesF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/set_engineering_services_Offers',
      data: formData,
    );
    print('done');
    print(response.data);
    return EngineeringServicesOffersM.fromMap(response.data);
  }

  // getRealStateF
  Future<RealStateM> getRealStateF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/set_real_estate_investment_offers',
      data: formData,
    );
    print('done');
    print(response.data);
    return RealStateM.fromMap(response.data);
  }

  // getOtherServicesF
  Future<OtherServicesM> getOtherServicesF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/set_other_services',
      data: formData,
    );
    print('done');
    print(response.data);
    return OtherServicesM.fromMap(response.data);
  }

  // getDesignNowF
  Future<DesignNowM> getDesignNowF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/set_design_now',
      data: formData,
    );
    print('done');
    print(response.data);
    return DesignNowM.fromMap(response.data);
  }

  // getResidentialTypesF
  Future<ResidentialTypesM> getResidentialTypesF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/set_types_housing',
      data: formData,
    );
    print('done');
    print(response.data);
    return ResidentialTypesM.fromMap(response.data);
  }

  // getArchResidentialF
  Future<ArchResidentialM> getArchResidentialF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/architectural_residential_design',
      data: formData,
    );
    print('done');
    print(response.data);
    return ArchResidentialM.fromMap(response.data);
  }

  // getConstResidentialF
  Future<ConstResidentialM> getConstResidentialF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/residential_construction_designn',
      data: formData,
    );
    print('done');
    print(response.data);
    return ConstResidentialM.fromMap(response.data);
  }

  // getCommercialServiceF
  Future<CommercialDesignM> getCommercialServiceF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/set_commercial_service',
      data: formData,
    );
    print('done');
    print(response.data);
    return CommercialDesignM.fromMap(response.data);
  }


  // getGeneralFixF
  Future<GeneralFixM> getGeneralFixF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/set_general_maintenance',
      data: formData,
    );
    print('done');
    print(response.data);
    return GeneralFixM.fromMap(response.data);
  }

  // sendCostBuildF
  Future<ResAnsM> sendCostBuildF({
    String? key,
    String? token_id,
    String? cat_id,
    String? answer,
    String? st1,
    String? st2,
    String? elevators,
    String? floors,
    String? space,
    dynamic file,
    dynamic file2,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "cat_id": cat_id,
      "answer": answer,
      'st1': st1,
      'st2': st2,
      'elevators': elevators,
      'floors': floors,
      'space': space,
      "pdffile": file,
      "pdffile2": file2,
    });
    final response = await dio.post(
      '$baseurl/user_api/set_replay',
      data: formData,
    );
    print('done');
    print(response.data);
    return ResAnsM.fromMap(response.data);
  }

  // getProjects
  Future<ProjectsM> getProjects({
    required String key,
    required String token_id,
    required String limit,
    required String page_number,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "limit": limit,
      "page_number": page_number,
    });
    final response = await dio.post(
      '$baseurl/user_api/get_all_projects',
      data: formData,
    );
    print('done');
    print(response.data);
    return ProjectsM.fromMap(response.data);
  }
  // getProDetails
  Future<ProjectDetailsM> getProDetails({
    required String key,
    required String token_id,
    required String project_id,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "project_id": project_id,
    });
    final response = await dio.post(
      '$baseurl/user_api/get_project_details',
      data: formData,
    );
    print('done');
    print(response.data);
    return ProjectDetailsM.fromMap(response.data);
  }

  // editPro
  Future<EditProM> editPro({
     String? key,
     String? token_id,
     String? fullname,
     String? phone,
     String? email,
     String? country,
     String? project_id,
     String? address,
     String? description,
     String? status,
     String? services,
     String? cost,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "fullname": fullname,
      "phone": phone,
      "email": email,
      "project_id": project_id,
      "address": address,
      "description": description,
      "status": status,
      "country": country,
      "services": services,
      "cost": cost,
    });
    final response = await dio.post(
      '$baseurl/user_api/edit_project',
      data: formData,
    );
    print('done');
    print(response.data);
    return EditProM.fromMap(response.data);
  }

  //OrdersList
  Future<OrdersM> getOrdes({
    required String key,
    required String token_id,
    required String lang,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "lang": lang,
    });

    final response = await dio.post(
      '$baseurl/store/get_list_myorders',
      data: formData,
    );
    print('done');
    print(response.data);
    return OrdersM.fromMap(response.data);
  }


  //OrderDetailsList
  Future<OrderDetailsM> getOrderDetails({
    required String key,
    required String token_id,
    required String lang,
    required String? id_order,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "lang": lang,
      "id_order": id_order,
    });

    final response = await dio.post(
      '$baseurl/store/get_order_details',
      data: formData,
    );
    print('done');
    print(response.data);
    return OrderDetailsM.fromMap(response.data);
  }


  //OrderDetailsMoney
  Future<OrderDetailsMoneyM> getOrderDetailsMoney({
    required String key,
    required String token_id,
    required String? id_order,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "id_order": id_order,
    });

    final response = await dio.post(
      '$baseurl/store/get_select_payment',
      data: formData,
    );
    print('done');
    print(response.data);
    return OrderDetailsMoneyM.fromMap(response.data);
  }

  Future<GalleryOfferModel> getAllDesigns({
     String? key,
     String? token_id,
     String? lang,
     String? limit,
     String? pageNumber,
  }) async {
    FormData formData = FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "limit": limit,
      "page_number": pageNumber,
    });

    final response = await dio.post(
      '$baseurl/store/get_all_designs',
      data: formData,
    );
    print(response.data);
    return GalleryOfferModel.fromJson(response.data);
  }


  Future<Response> sendPaymentDetails({
    required String token_id,
    required int designId,
    required String? name,
    required String? phone,
    required String? address,
    required String? message,
    required String? email,
    required int paymentType,
  }) async {
    FormData formData = FormData.fromMap({
      "key": "1234567890",
      "token_id": token_id,
      "id_design": designId,
      "email": email,
      "name": name,
      "phone": phone,
      "address": address,
      "message": message,
      "payment_type": paymentType,
    });

    final response = await dio.post(
      '$baseurl/store/add_to_cart',
      data: formData,
    );
    print(response.data);
    return response;
  }

}
