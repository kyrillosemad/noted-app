import 'package:todo/data/services/links/delete_link_fun.dart';
import 'package:todo/data/services/links/insert_link_fun.dart';
import 'package:todo/data/services/links/read_link_fun.dart';
import 'package:todo/data/services/links/update_link_fun.dart';

class LinksRepo {
  insertLink(title, body, ownerId, link) {
    return insert_links_fun(title, body, ownerId, link);
  }

  deleteLink(linkId) {
    return delete_links_fun(linkId);
  }

  updateLink(title, body, linkId, link) {
    return update_links_fun(title, body, linkId, link);
  }

  readLinks() {
    return read_links_fun();
  }
}
