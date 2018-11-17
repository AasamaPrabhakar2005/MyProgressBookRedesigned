package com.sb.web.redesigned.HelloWorldSB.ibatis.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sb.web.redesigned.HelloWorldSB.ibatis.bean.GradeBean;
import com.sb.web.redesigned.HelloWorldSB.ibatis.bean.ParentBean;
import com.sb.web.redesigned.HelloWorldSB.ibatis.bean.StudentBean;
import com.sb.web.redesigned.HelloWorldSB.Grade;

public class IbatisDao implements Dao{
    @Override
    public String getPasswordFromDB(String username,SqlMapClient sqlmapClient) {
        try
        {
        	StudentBean user = (StudentBean)sqlmapClient.queryForObject("user.getPasswordFromDB", username);
            return user.getPassword();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public String getParentPasswordFromDB(String username,SqlMapClient sqlmapClient) {
    	
    	try
        {
    		ParentBean user = (ParentBean) sqlmapClient.queryForObject("user.getParentPasswordFromDB", username);
            return user.getPassword();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public String getParentEmailFromDB(String username,SqlMapClient sqlmapClient) {
    	
    	try
        {
    		ParentBean user = (ParentBean) sqlmapClient.queryForObject("user.getParentEmailFromDB", username);
            return user.getEmail();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public Hashtable getStudent(String guardian,SqlMapClient sqlmapClient) {
    	Hashtable student= new Hashtable();
    	try
        {
        	 student = (Hashtable)sqlmapClient.queryForList("user.getStudent", guardian);
            return student;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public Integer getStudentId(String username,SqlMapClient sqlmapClient) {
        try
        {
        	StudentBean user = (StudentBean)sqlmapClient.queryForObject("user.getStudentId", username);
            return user.getId();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }
 
    @Override
    public List<GradeBean> getStudentGrade(Integer id,SqlMapClient sqlmapClient) {
        try
        {
        	List<GradeBean> userGrades = (List<GradeBean>)sqlmapClient.queryForList("user.getStudentGrade", id);
        	return userGrades;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }
	@Override
	public ParentBean add2IbatisParent(ParentBean user, String username, String password, String email, String question,
		String answer, SqlMapClient sqlmapClient) {
		 user.setUsername(username);
		 user.setPassword(password);
		 user.setEmail(email);
		 user.setQuestion(question);
		 user.setAnswer(answer);
		 user.setVerify("false");
		try {
			sqlmapClient.insert("user.add2IbatisParent", user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public ParentBean ConfirmEmail(ParentBean user, String username,SqlMapClient sqlMapClient) {
		user.setUsername(username);
		user.setVerify("true");
		try {
			sqlMapClient.update("user.ConfirmEmail", user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	}