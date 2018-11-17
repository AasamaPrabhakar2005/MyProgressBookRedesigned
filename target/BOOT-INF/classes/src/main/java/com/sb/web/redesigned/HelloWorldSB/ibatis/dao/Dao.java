package com.sb.web.redesigned.HelloWorldSB.ibatis.dao;

import java.util.Hashtable;
import java.util.List;

import com.sb.web.redesigned.HelloWorldSB.ibatis.bean.ParentBean;
import com.sb.web.redesigned.HelloWorldSB.ibatis.bean.StudentBean;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.sb.web.redesigned.HelloWorldSB.ibatis.bean.GradeBean;

public interface Dao {
public ParentBean add2IbatisParent(ParentBean user, String username,String password,String email,String question,String answer, SqlMapClient sqlmapClient);
public	String getPasswordFromDB(String username, SqlMapClient sqlMapClient);
public	String getParentPasswordFromDB(String username, SqlMapClient sqlMapClient);
public	String getParentEmailFromDB(String username, SqlMapClient sqlMapClient);
public	Hashtable getStudent(String guardian, SqlMapClient sqlMapClient);
public	Integer getStudentId(String username, SqlMapClient sqlMapClient);
public ParentBean ConfirmEmail(ParentBean user,String username, SqlMapClient sqlMapClient);
public List<GradeBean> getStudentGrade(Integer id, SqlMapClient sqlmapClient);
}
