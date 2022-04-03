import 'package:follow_fan/data/models/link_model.dart';
import 'package:follow_fan/data/models/link_type_model.dart';
import 'package:follow_fan/data/services.dart';
import 'package:get/get.dart';

class LinksService extends Services {
  Future<List<LinkModel>> getMyLinks() async => await api
          .request(Services.myLinks, "GET", showErrorMessage: false)
          .then((data) {
        if (data == null) return [];
        final List<LinkModel> links = LinkModel.listFromJson(data["links"]);
        return links;
      });

  Future<List<LinkTypeModel>> getLinkTypes() async =>
      await api.request(Services.linkTypes, "GET").then((data) {
        if (data == null) return [];
        final List<LinkTypeModel> links =
            LinkTypeModel.listFromJson(data["types"]);
        return links;
      });

  Future<LinkModel?> addLink({
    required String type,
    required int points,
    required String link,
  }) async =>
      await api.request(Services.addLink, "PUT", showSuccessMessage: true,
          onDismiss: () {
        Get.offAllNamed("/home");
      }, data: {"type": type, "points": points, "link": link}).then((data) {
        if (data == null) return null;
        final LinkModel link = LinkModel.fromJson(data["link"]);
        return link;
      });

  Future<bool> cancelLink({
    required String linkId,
  }) async =>
      await api.request(Services.cancelLink, "DELETE",
          showSuccessMessage: true,
          data: {"linkId": linkId}).then((isSuccess) => isSuccess);
}
