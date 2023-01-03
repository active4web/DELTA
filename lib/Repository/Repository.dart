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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../DataModel/FormsModels/set_replayM.dart';

//Intro

class Repository {
  var baseurl = 'https://mdecco.com/app/';
  Dio dio = new Dio();

  Future<SetReplay> done({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    SetReplay data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_replay',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = SetReplay.fromJson(value.data);
    });
    return data;
  }

  //Intro
  Future<IntroM> getIntro({
    @required String key,
  }) async {
    IntroM data;
    FormData formData = new FormData.fromMap({
      "key": key,
    });
    await dio
        .post(
      baseurl + '/user_api/get_intro',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = IntroM.fromMap(value.data);
    });
    return data;
  }

  Future<OffersAndDesignsModel> getOffersAndDesigns({
    @required String key,
    @required String token,
    @required String catId,
  }) async {
    OffersAndDesignsModel data;
    FormData formData =
        new FormData.fromMap({"key": key, "token_id": token, "cat_id": catId});
    await dio
        .post(
      baseurl + '/user_api/types_housing',
      data: formData,
    )
        .then((value) {
      print(value.data);
      data = OffersAndDesignsModel.fromJson(value.data);
    });
    return data;
  }

  Future<OffersAndDesignsModel> getConstructionCosts({
    @required String key,
    @required String token,
    @required String catId,
  }) async {
    OffersAndDesignsModel data;
    FormData formData =
        new FormData.fromMap({"key": key, "token_id": token, "cat_id": catId});
    await dio
        .post(
      baseurl + '/user_api/set_construction_costs',
      data: formData,
    )
        .then((value) {
      print(value.data);
      data = OffersAndDesignsModel.fromJson(value.data);
    });
    return data;
  }

  Future<RegisterationModel> registerAccount(
      {@required String phone,
      @required String key,
      @required String fullname,
      @required String password,
      @required String email,
      @required String address,
      @required String lang,
      @required String firebase_id,
      @required String country}) async {
    RegisterationModel data;
    FormData formData = new FormData.fromMap({
      "phone": phone,
      "key": key,
      "password": password,
      "email": email,
      "fullname": fullname,
      "address": address,
      "lang": lang,
      "firebase_id": firebase_id,
      "country": country
    });
    await dio
        .post(
      baseurl + '/user_api/set_registration',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = RegisterationModel.fromJson(value.data);
    });
    return data;
  }

  //registerListCountry
  Future<RegistrationListM> registerListCountry(
      {@required String key, @required String lang}) async {
    RegistrationListM data;
    FormData formData = new FormData.fromMap({"key": key, "lang": lang});
    await dio
        .post(
      baseurl + '/user_api/preparation_registeration',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = RegistrationListM.fromMap(value.data);
    });
    return data;
  }

//Login
  Future<LoginM> loginAccount({
    @required String phone,
    @required String password,
    @required String firebase_id,
    @required String key,
  }) async {
    print(phone);
    print(password);
    LoginM data;
    FormData formData = new FormData.fromMap({
      "phone": phone,
      "password": password,
      "firebase_id": firebase_id,
      "key": key,
    });
    await dio
        .post(
      baseurl + '/pages/set_login',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = LoginM.fromMap(value.data);
    });
    return data;
  }

  //home
  Future<HomeM> getHome({
    @required String token_id,
    @required String key,
  }) async {
    HomeM data;
    FormData formData = new FormData.fromMap({
      "token_id": token_id,
      "key": key,
    });
    await dio
        .post(
      baseurl + '/user_api/get_home',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = HomeM.fromMap(value.data);
    });
    return data;
  }

  //ArticleCat

  Future<ArticleCatM> getArticleCat({
    @required String token_id,
    @required String key,
  }) async {
    ArticleCatM data;
    FormData formData = new FormData.fromMap({
      "token_id": token_id,
      "key": key,
    });
    await dio
        .post(
      baseurl + '/user_api/get_all_article_categories',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ArticleCatM.fromMap(value.data);
    });
    return data;
  }

  //Contact Info
  Future<ContactInfoM> getContact({
    @required String token_id,
    @required String key,
  }) async {
    ContactInfoM data;
    FormData formData = new FormData.fromMap({
      "token_id": token_id,
      "key": key,
    });
    await dio
        .post(
      baseurl + '/pages/get_contact_info',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ContactInfoM.fromMap(value.data);
    });
    return data;
  }

  //about App
  Future<AboutUsM> getAboutApp({
    @required String token_id,
    @required String key,
  }) async {
    AboutUsM data;
    FormData formData = new FormData.fromMap({
      "token_id": token_id,
      "key": key,
    });
    await dio
        .post(
      baseurl + '/pages/about',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = AboutUsM.fromMap(value.data);
    });
    return data;
  }

  //Article
  Future<ArticleM> getArticle(
      {@required String token_id,
      @required String key,
      @required String article_id}) async {
    ArticleM data;
    FormData formData = new FormData.fromMap(
        {"token_id": token_id, "key": key, "article_id": article_id});
    await dio
        .post(
      baseurl + '/user_api/get_all_articles_details',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ArticleM.fromMap(value.data);
    });
    return data;
  }

  //getTickets
  Future<UserTicketsM> getTickets({
    @required String token_id,
    @required String key,
    @required String limit,
    @required String page_number,
  }) async {
    UserTicketsM data;
    FormData formData = new FormData.fromMap({
      "token_id": token_id,
      "key": key,
      "limit": limit,
      "page_number": page_number
    });
    await dio
        .post(
      baseurl + '/pages/tickets',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = UserTicketsM.fromMap(value.data);
    });
    return data;
  }

  //TicketList
  Future<UserTicketsListM> TicketList(
      {@required String key, @required String token}) async {
    UserTicketsListM data;
    FormData formData = new FormData.fromMap({"key": key, "token_id": token});
    await dio
        .post(
      baseurl + '/pages/tickets_types',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = UserTicketsListM.fromMap(value.data);
    });
    return data;
  }

  //makeTicket
  Future<MakeTicketM> makeTicket({
    @required String key,
    @required String token,
    @required String ticket_type_id,
    @required String title,
    @required String content,
  }) async {
    MakeTicketM data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token,
      "ticket_type_id": ticket_type_id,
      "title": title,
      "content": content
    });
    await dio
        .post(
      baseurl + '/pages/new_ticket',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = MakeTicketM.fromMap(value.data);
    });
    return data;
  }

//makeTicket
  Future<TicketInfoM> getTicketInfo({
    @required String key,
    @required String token_id,
    @required String ticket_id,
  }) async {
    TicketInfoM data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "ticket_id": ticket_id,
    });
    await dio
        .post(
      baseurl + '/pages/ticket',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = TicketInfoM.fromMap(value.data);
    });
    return data;
  }

  //get_Notify

  Future<NotifyListM> get_Notify({
    @required String key,
    @required String token_id,
    @required String limit,
    @required String page_number,
  }) async {
    NotifyListM data;
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

  //

  //get_Notify_Det

  Future<NotifyDetailsM> getNotifyDetails({
    @required String key,
    @required String token_id,
    @required String id_notify,
  }) async {
    NotifyDetailsM data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "id_notify": id_notify,
    });
    await dio
        .post(
      baseurl + '/pages/get_notification_details',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = NotifyDetailsM.fromMap(value.data);
    });
    return data;
  }

  //del_Notify

  Future<DeleteNotifyM> del_Notify({
    @required String key,
    @required String token_id,
    @required String id_notfy,
  }) async {
    DeleteNotifyM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "id_notfy": id_notfy});
    await dio
        .post(
      baseurl + '/pages/delete_notification',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = DeleteNotifyM.fromMap(value.data);
    });
    return data;
  }

  //message

  Future<MessageSentM> messageSentReply({
    @required String key,
    @required String token_id,
    @required String name,
    @required String phone,
    @required String message,
  }) async {
    MessageSentM data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "name": name,
      "phone": phone,
      "message": message
    });
    await dio
        .post(
      baseurl + '/pages/send_message',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = MessageSentM.fromMap(value.data);
    });
    return data;
  }

//ticketReply

  Future<TicketReplyM> ticketReply(
      {@required String key,
      @required String token_id,
      @required String ticket_id,
      @required String content}) async {
    TicketReplyM data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "ticket_id": ticket_id,
      "content": content
    });
    await dio
        .post(
      baseurl + '/pages/new_reply',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = TicketReplyM.fromMap(value.data);
    });
    return data;
  }

  //proInfo
  Future<ProfileInfoM> proInfo({
    @required String key,
    @required String token_id,
  }) async {
    ProfileInfoM data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token_id,
    });
    await dio
        .post(
      baseurl + '/pages/preparation_profile',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ProfileInfoM.fromMap(value.data);
    });
    return data;
  }

  //getCostBuildF
  Future<BuildCostM> getCostBuildF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    BuildCostM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_commissioning_estimate',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = BuildCostM.fromMap(value.data);
    });
    return data;
  }

  Future<BuildCostM> getBuildingCostFinishedKey({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    BuildCostM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_buildingcostfinishKey',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = BuildCostM.fromMap(value.data);
    });
    return data;
  }

  //getContractingOffersM
  Future<ContractingOffersM> getContractingOffersF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    ContractingOffersM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_contracting_offers',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ContractingOffersM.fromMap(value.data);
    });
    return data;
  }

  //getengineering_services
  Future<EngineeringServicesOffersM> getEngineeringServicesF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    EngineeringServicesOffersM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_engineering_services_Offers',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = EngineeringServicesOffersM.fromMap(value.data);
    });
    return data;
  }

  //getReal_stae
  Future<RealStateM> getRealStateF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    RealStateM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_real_estate_investment_offers',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = RealStateM.fromMap(value.data);
    });
    return data;
  }

  //getOtherServicesF
  Future<OtherServicesM> getOtherServicesF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    OtherServicesM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_other_services',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = OtherServicesM.fromMap(value.data);
    });
    return data;
  }

  //getdesignnow
  Future<DesignNowM> getDesignNowF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    DesignNowM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_design_now',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = DesignNowM.fromMap(value.data);
    });
    return data;
  }

  //getResidentialTypes
  Future<ResidentialTypesM> getResidentialTypesF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    ResidentialTypesM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_types_housing',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ResidentialTypesM.fromMap(value.data);
    });
    return data;
  }

  //getArchResidential
  Future<ArchResidentialM> getArchResidentialF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    ArchResidentialM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/architectural_residential_design',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ArchResidentialM.fromMap(value.data);
    });
    return data;
  }

  //getConstResidentialF
  Future<ConstResidentialM> getConstResidentialF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    ConstResidentialM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/residential_construction_designn',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ConstResidentialM.fromMap(value.data);
    });
    return data;
  }

  //getCommercialServiceF
  Future<CommercialDesignM> getCommercialServiceF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    CommercialDesignM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_commercial_service',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = CommercialDesignM.fromMap(value.data);
    });
    return data;
  }

  //getGeneralFixF
  Future<GeneralFixM> getGeneralFixF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    GeneralFixM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_general_maintenance',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = GeneralFixM.fromMap(value.data);
    });
    return data;
  }

  //sendCostBuildF
  Future<ResAnsM> sendCostBuildF({
    @required String key,
    @required String token_id,
    @required String cat_id,
    @required String answer,
    @required String st1,
    @required String st2,
    @required String elevators,
    @required String floors,
    @required String space,
    dynamic file,
    dynamic file2,
  }) async {
    ResAnsM data;
    FormData formData = new FormData.fromMap({
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
    await dio
        .post(
      baseurl + '/user_api/set_replay',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ResAnsM.fromMap(value.data);
    });
    return data;
  }

  //Projects
  Future<ProjectsM> getProjects({
    @required String key,
    @required String token_id,
    @required String limit,
    @required String page_number,
  }) async {
    ProjectsM data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "limit": limit,
      "page_number": page_number
    });
    await dio
        .post(
      baseurl + '/user_api/get_all_projects',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ProjectsM.fromMap(value.data);
    });
    return data;
  }

  //ProjectsDetails
  Future<ProjectDetailsM> getProDetails({
    @required String key,
    @required String token_id,
    @required String project_id,
  }) async {
    ProjectDetailsM data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "project_id": project_id,
    });
    await dio
        .post(
      baseurl + '/user_api/get_project_details',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ProjectDetailsM.fromMap(value.data);
    });
    return data;
  }

  //EditPro
  Future<EditProM> editPro({
    @required String key,
    @required String token_id,
    @required String fullname,
    @required String phone,
    @required String address,
    @required String country,
    @required String email,
  }) async {
    EditProM data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "fullname": fullname,
      "phone": phone,
      "address": address,
      "country": country,
      "email": email
    });
    await dio
        .post(
      baseurl + '/pages/edit_profile',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = EditProM.fromMap(value.data);
    });
    return data;
  }

  //OrdersList
  Future<OrdersM> getOrdes({
    @required String key,
    @required String token_id,
    @required String lang,
  }) async {
    OrdersM data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "lang": lang,
    });
    await dio
        .post(
      baseurl + '/store/get_list_myorders',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = OrdersM.fromMap(value.data);
    });
    return data;
  }

  //OrderDetailsList
  Future<OrderDetailsM> getOrderDetails(
      {@required String key,
      @required String token_id,
      @required String lang,
      @required String id_order}) async {
    OrderDetailsM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "lang": lang, "id_order": id_order});
    await dio
        .post(
      baseurl + '/store/get_order_details',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = OrderDetailsM.fromMap(value.data);
    });
    return data;
  }

  //OrderDetailsMoney
  Future<OrderDetailsMoneyM> getOrderDetailsMoney(
      {@required String key,
      @required String token_id,
      @required String id_order}) async {
    OrderDetailsMoneyM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "id_order": id_order});
    await dio
        .post(
      baseurl + '/store/get_select_payment',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = OrderDetailsMoneyM.fromMap(value.data);
    });
    return data;
  }

  Future<GalleryOfferModel> getAllDesigns(
      {@required String key,
      @required String token_id,
      @required String lang,
      @required String limit,
      @required String pageNumber}) async {
    GalleryOfferModel data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token_id,
      "limit": limit,
      "page_number": pageNumber
    });
    await dio
        .post(
      baseurl + '/store/get_all_designs',
      data: formData,
    )
        .then((value) {
      print(value.data);
      data = GalleryOfferModel.fromJson(value.data);
    });
    return data;
  }

  Future<Response> sendPaymentDetails(
      {@required String token_id,
      @required int designId,
      @required String name,
      @required String phone,
      @required String address,
      @required String message,
      @required String email,
      @required int paymentType}) async {
    Response data;
    FormData formData = new FormData.fromMap({
      "key": "1234567890",
      "token_id": token_id,
      "id_design": designId,
      "email": email,
      "name": name,
      "phone": phone,
      "address": address,
      "message": message,
      "payment_type": paymentType
    });
    await dio
        .post(
      baseurl + '/store/add_to_cart',
      data: formData,
    )
        .then((value) {
      print(value.data);
      data = value;
    });
    return data;
  }
}
