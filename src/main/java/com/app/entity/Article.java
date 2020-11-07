package com.app.entity;
public class Article {
 public int id;
 public String uid;
 public Users u;
 
 
 public Users getU() {
	return u;
}
public void setU(Users u) {
	this.u = u;
}
public void setUid(String uid){ 
 this.uid=uid;
 } 
 public String getUid(){
 return uid;
 } 
 public String title;
 public void setTitle(String title){ 
 this.title=title;
 } 
 public String getTitle(){
 return title;
 } 
 public String thumb;
 public void setThumb(String thumb){ 
 this.thumb=thumb;
 } 
 public String getThumb(){
 return thumb;
 } 
 public String description;
 public void setDescription(String description){ 
 this.description=description;
 } 
 public String getDescription(){
 return description;
 } 
 public String bodytext;
 public void setBodytext(String bodytext){ 
 this.bodytext=bodytext;
 } 
 public String getBodytext(){
 return bodytext;
 } 
 public String created;
 public void setCreated(String created){ 
 this.created=created;
 } 
 public String getCreated(){
 return created;
 } 
 public String click;
 public void setClick(String click){ 
 this.click=click;
 } 
 public String getClick(){
 return click;
 } 
 public String support;
 public void setSupport(String support){ 
 this.support=support;
 } 
 public String getSupport(){
 return support;
 } 
 public String tags;
 public void setTags(String tags){ 
 this.tags=tags;
 } 
 public String getTags(){
 return tags;
 } 
 public String filepath;
 public void setFilepath(String filepath){ 
 this.filepath=filepath;
 } 
 public String getFilepath(){
 return filepath;
 } 
public void setId(int id) {
this.id = id;
}

public int getId() {
return id;
}

}