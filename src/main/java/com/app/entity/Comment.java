package com.app.entity;
public class Comment {
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
 public String mid;
 public void setMid(String mid){ 
 this.mid=mid;
 } 
 public String getMid(){
 return mid;
 } 
 public String content;
 public void setContent(String content){ 
 this.content=content;
 } 
 public String getContent(){
 return content;
 } 
 public String type;
 public void setType(String type){ 
 this.type=type;
 } 
 public String getType(){
 return type;
 } 
 public String created;
 public void setCreated(String created){ 
 this.created=created;
 } 
 public String getCreated(){
 return created;
 } 
 public String updated;
 public void setUpdated(String updated){ 
 this.updated=updated;
 } 
 public String getUpdated(){
 return updated;
 } 
 public String status;
 public void setStatus(String status){ 
 this.status=status;
 } 
 public String getStatus(){
 return status;
 } 
 public String subject;
 public void setSubject(String subject){ 
 this.subject=subject;
 } 
 public String getSubject(){
 return subject;
 } 
 public String pid;
 public void setPid(String pid){ 
 this.pid=pid;
 } 
 public String getPid(){
 return pid;
 } 
public void setId(int id) {
this.id = id;
}

public int getId() {
return id;
}

}