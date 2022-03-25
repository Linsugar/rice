class MarkModel{
  String ?title;
  String ?media_id;
  String ?thumb_media_id;
  int ?show_cover_pic;
  String ?author;
  String ?digest;
  var content;
  String ?url;
  String ?content_source_url;
  String ?thumb_url;
  num ?update_time;
  MarkModel(Value){
    this.media_id = Value["media_id"];
    this.content = Value["content"];
    var newsitem = Value["content"]["news_item"][0];
    this.title = newsitem["title"];
    this.thumb_media_id = newsitem["thumb_media_id"];
    this.show_cover_pic = newsitem["show_cover_pic"];
    this.author = newsitem["author"];
    this.digest = newsitem["digest"];
    this.url = newsitem["url"];
    this.content_source_url = newsitem["content_source_url"];
    this.thumb_url = newsitem["thumb_url"];
    this.update_time = newsitem["update_time"];
  }
}