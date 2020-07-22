<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="relation.RelationDAO"%>
<%@ page import="relation.Relation"%>
<%@ page import="user.User2DAO"%>
<%@ page import="user.User2"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.*"%>
<%
request.setCharacterEncoding("UTF-8");
int level = Integer.parseInt(request.getParameter("mbti_level"));

RelationDAO rel = new RelationDAO();
ArrayList<User2> list2 = rel.get_RList((String) session.getAttribute("u_id"), level);

JSONArray series = new JSONArray();

for (int i = 0; i < list2.size(); i++) {
	JSONObject obj = new JSONObject();
	obj.put("u_id", list2.get(i).getU_id());
	obj.put("u_name", list2.get(i).getU_name());
	obj.put("u_gender", list2.get(i).getU_gender());
	obj.put("u_age", list2.get(i).getU_age());
	obj.put("u_loc", list2.get(i).getU_loc());
	obj.put("u_hobby", list2.get(i).getU_hobby());
	obj.put("u_talent", list2.get(i).getU_talent());
	obj.put("u_mbti", list2.get(i).getU_mbti());
	obj.put("u_img", list2.get(i).getU_img());
	
	
	JSONArray data = new JSONArray();
	data.add(i);
	
	obj.put("data", data);
	series.add(obj);
}
out.println(series);
%>