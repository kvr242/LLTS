/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Random;

/**
 *
 * @author WIN8
 */

public class GetQueryInfo {
        public Connection con = null;
	public Statement stmt = null;
	public ResultSet rs = null;
        boolean status = false;
        public static Random rand = new Random();
    public static String getDate(){
        java.util.Date now = new java.util.Date();
        String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss a";
	SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
	return sdf1.format(now);
    }  
    public static String dba_firstname;
    public static String dba_lastname;
    public static String dba_userid;
    public boolean checkdbaLogin(String dba_un, String dba_pwd, String dba_password) {
        //System.out.println("checkHrLogin - start");
        con = DBCon.DbConnection.getConnection();
	try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("select firstname,lastname,userid from dbareg where userid='"+ dba_un + "' and password='" + dba_pwd + "' and dbapassword='"+dba_password+"'");
            if (rs.next()) {
                dba_firstname = rs.getString(1);
                dba_lastname = rs.getString(2);
                dba_userid = rs.getString(3);
		status = true;
            } else {
                status = false;
            }
	} catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }  
    public static String dba_password;
    public static String dba_email;
    public boolean checkdbaFpLogin(String dba_un) {
        //System.out.println("checkHrLogin - start");
        con = DBCon.DbConnection.getConnection();
	try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("select firstname,lastname,userid,password,email from dbareg where userid='"+ dba_un + "'");
            if (rs.next()) {
                dba_firstname = rs.getString(1);
                dba_lastname = rs.getString(2);
                dba_userid = rs.getString(3);
                dba_password = rs.getString(4);
                dba_email = rs.getString(5);
		status = true;
            } else {
                status = false;
            }
	} catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }  
    public boolean dbaUpdateDataCheck(String userid, String usertype){
        con = DBCon.DbConnection.getConnection();
        try {
            stmt = con.createStatement();
            ResultSet result = stmt.executeQuery("select * from updatedatabase where userid='"+userid+"' and usertype='"+usertype+"'");
            while(result.next()){
                System.out.println("user details available in updatedatabase table : "+userid);
                status = true;
            }
            
        }catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public boolean newDbaReg(String firstname,String lastname,String userid,String password,String dbapassword,String contactno,String email,String securityquestion,String securityanswer){
        con = DBCon.DbConnection.getConnection();
        String uniqueDbaCode = dbapassword+""+rand.nextInt(165984656);
        try {
            stmt = con.createStatement();
            int result = stmt.executeUpdate("insert into dbareg values('"+firstname+"','"+lastname+"','"+userid+"','"+password+"','"+uniqueDbaCode+"',"+contactno+",'"+email+"','"+securityquestion+"','"+securityanswer+"','"+getDate()+"')");
            if (result >= 1) {
		status = true;
		System.out.println("insert dba Entry ******************************** User_id="+userid);
            } else {
                status = false;
            }
        }catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public boolean updateDbaReg(String firstname,String lastname,String userid,String password,String contactno,String email,String securityquestion,String securityanswer){
        con = DBCon.DbConnection.getConnection();
        try {
            stmt = con.createStatement();
            int result = stmt.executeUpdate("update dbareg set firstname='"+firstname+"',lastname='"+lastname+"',password='"+password+"',contactno='"+contactno+"',email='"+email+"',securityquestion='"+securityquestion+"',securityanswer='"+securityanswer+"',regdate='"+getDate()+"' where userid='"+userid+"'");
            if (result >= 1) {
		status = true;
		System.out.println("Update dba Entry ******************************** User_id="+userid);
            } else {
                status = false;
            }
        }catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public boolean newLlReg(String firstname,String lastname,String agentname,String userid,String password,String dbapassword,String contactno,String email,String securityquestion,String securityanswer){
        con = DBCon.DbConnection.getConnection();
        String uniqueLlCode = dbapassword+""+rand.nextInt(165984656);
        try {
            stmt = con.createStatement();
            //System.out.println("insert into landlordreg values('"+firstname+"','"+lastname+"','"+agentname+"','"+userid+"','"+password+"','"+uniqueLlCode+"',"+contactno+",'"+email+"','"+securityquestion+"','"+securityanswer+"','"+getDate()+"')");
            int result = stmt.executeUpdate("insert into landlordreg values('"+firstname+"','"+lastname+"','"+agentname+"','"+userid+"','"+password+"','"+uniqueLlCode+"',"+contactno+",'"+email+"','"+securityquestion+"','"+securityanswer+"','"+getDate()+"','Active')");
            if (result >= 1) {
		status = true;
		System.out.println("insert landlord Entry ******************************** User_id="+userid);
            } else {
                status = false;
            }
        }catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    
    
    
    
    
    
    public static String ll_firstname;
    public static String ll_lastname;
    public static String ll_userid;
    public boolean checkllLogin(String llUserId, String llUserpassword) {
        //System.out.println("checkHrLogin - start");
        con = DBCon.DbConnection.getConnection();
	try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("select firstname,lastname,userid from landlordreg where userid='"+ llUserId + "' and password='" + llUserpassword + "'");
            if (rs.next()) {
                ll_firstname = rs.getString(1);
                ll_lastname = rs.getString(2);
                ll_userid = rs.getString(3);
		status = true;
            } else {
                status = false;
            }
	} catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public static String ll_password;
    public static String ll_email;
    public boolean checkllFpLogin(String llUserId) {
        //System.out.println("checkHrLogin - start");
        con = DBCon.DbConnection.getConnection();
	try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("select firstname,lastname,userid,password,email from landlordreg where userid='"+ llUserId + "'");
            if (rs.next()) {
                ll_firstname = rs.getString(1);
                ll_lastname = rs.getString(2);
                ll_userid = rs.getString(3);
                ll_password = rs.getString(4);
                ll_email = rs.getString(5);
		status = true;
            } else {
                status = false;
            }
	} catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public boolean updateDbaAction(String query, String userid){
        con = DBCon.DbConnection.getConnection();
        try {
            stmt = con.createStatement();
            int result = stmt.executeUpdate(query);
            if (result >= 1) {
		status = true;
		System.out.println("DBA Update Entry ******************************** User_id="+userid);
            } else {
                status = false;
            }
        }catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public boolean updateDbaData(String query, String userid){
        con = DBCon.DbConnection.getConnection();
        try {
            stmt = con.createStatement();
            int result = stmt.executeUpdate(query);
            if (result >= 1) {
		status = true;
		System.out.println("DBA Update Data Entry ******************************** User_id="+userid);
            } else {
                status = false;
            }
        }catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public boolean updatellReg(String firstname,String lastname,String agentname,String userid,String password,String contactno,String email,String securityquestion,String securityanswer){
        con = DBCon.DbConnection.getConnection();
        try {
            stmt = con.createStatement();
            int result = stmt.executeUpdate("update landlordreg set firstname='"+firstname+"',agentname='"+agentname+"',lastname='"+lastname+"',password='"+password+"',contactno='"+contactno+"',email='"+email+"',securityquestion='"+securityquestion+"',securityanswer='"+securityanswer+"',regdate='"+getDate()+"' where userid='"+userid+"'");
            if (result >= 1) {
		status = true;
		System.out.println("Update landlord Entry ******************************** User_id="+userid);
            } else {
                status = false;
            }
        }catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public boolean addllpostproperty(String query,String llloginid, String propid) {
        //System.out.println("checkHrLogin - start");
        con = DBCon.DbConnection.getConnection();
	try {
            stmt = con.createStatement();
            int result = stmt.executeUpdate(query);
            if (result >= 1) {
		status = true;
		System.out.println("Add landlord post property entry ******************************** User_id="+llloginid);
            } else {
                status = false;
            }
	} catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public boolean newTReg(String firstname,String lastname,String userid,String password,String dbapassword,String contactno,String email,String securityquestion,String securityanswer){
        con = DBCon.DbConnection.getConnection();
        String uniqueTCode = dbapassword+""+rand.nextInt(165984656);
        try {
            stmt = con.createStatement();
            int result = stmt.executeUpdate("insert into tenantreg values('"+firstname+"','"+lastname+"','"+userid+"','"+password+"','"+uniqueTCode+"',"+contactno+",'"+email+"','"+securityquestion+"','"+securityanswer+"','"+getDate()+"','Active')");
            if (result >= 1) {
		status = true;
		System.out.println("insert Tenant Entry ******************************** User_id="+userid);
            } else {
                status = false;
            }
        }catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public static String t_firstname;
    public static String t_lastname;
    public static String t_userid;
    public boolean checktLogin(String llUserId, String llUserpassword) {
        //System.out.println("checkHrLogin - start");
        con = DBCon.DbConnection.getConnection();
	try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("select firstname,lastname,userid from tenantreg where userid='"+ llUserId + "' and password='" + llUserpassword + "'");
            if (rs.next()) {
                t_firstname = rs.getString(1);
                t_lastname = rs.getString(2);
                t_userid = rs.getString(3);
		status = true;
            } else {
                status = false;
            }
	} catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public static String t_password;
    public static String t_email;
    public boolean checktFpLogin(String llUserId) {
        //System.out.println("checkHrLogin - start");
        con = DBCon.DbConnection.getConnection();
	try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("select firstname,lastname,userid,password,email from tenantreg where userid='"+ llUserId + "'");
            if (rs.next()) {
                t_firstname = rs.getString(1);
                t_lastname = rs.getString(2);
                t_userid = rs.getString(3);
                t_password = rs.getString(4);
                t_email = rs.getString(5);
		status = true;
            } else {
                status = false;
            }
	} catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    public boolean updatetReg(String firstname,String lastname,String userid,String password,String contactno,String email,String securityquestion,String securityanswer){
        con = DBCon.DbConnection.getConnection();
        try {
            stmt = con.createStatement();
            int result = stmt.executeUpdate("update tenantreg set firstname='"+firstname+"',lastname='"+lastname+"',password='"+password+"',contactno='"+contactno+"',email='"+email+"',securityquestion='"+securityquestion+"',securityanswer='"+securityanswer+"',regdate='"+getDate()+"' where userid='"+userid+"'");
            if (result >= 1) {
		status = true;
		System.out.println("Update Tenant Entry ******************************** User_id="+userid);
            } else {
                status = false;
            }
        }catch (Exception ex) {
            status = false;
            ex.printStackTrace();
	}
	closeObjects(con, stmt, rs);
	return status;
    }
    
    // Closing Opened Resources
    public static void closeObjects(Connection con, Statement stmt, ResultSet rs) {
	try {
            if (con != null) {
		con.close();
            } else if (stmt != null) {
		stmt.close();
            } else if (rs != null) {
		rs.close();
            }
            } catch (Exception ex) {
            	ex.printStackTrace();
            }
	}
}
