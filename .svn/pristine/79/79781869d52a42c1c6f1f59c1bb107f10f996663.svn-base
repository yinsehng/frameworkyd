package com.neusoft.server.socket.business.xxhq;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mchange.v2.c3p0.ComboPooledDataSource;
@Service
public class XxhqHandler {
	@Autowired
	@Qualifier("hrbsi")
	private  ComboPooledDataSource dataSource;
	
	
	/**
	 * 获取connection对象
	 * */
    public  Connection getConnection() {
        Connection conn = null;
        try {
        	conn= dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return conn;
    }
    
    public String businessHandle(String s)  {
    	System.out.println("信息获取。。。。。。。");
    	String[] inputs=s.split("\\^");
    	if(inputs[0].equals("0001")){//绑卡
    		String rts=bandingCard(inputs[1]);
    		if(rts.equals("ok")){
    			return "888888^^00^";
    		}else{
    			return "888888^"+rts+"^99^";
    		}
    	}else if(inputs[0].equals("0002")){//解绑
    		String rts=unBandingCard(inputs[1]);
    		if(rts.equals("ok")){
    			return "888888^^00^";
    		}else{
    			return "888888^"+rts+"^99^";
    		}
    	}else if(inputs[0].equals("0003")){//信息获取
    		System.out.println("账户信息查询入参.........."+inputs[1]);
    		String rts=getInfo(inputs[1]);
    		String[] rt=rts.split("\\|");
    		System.out.println("账户信息查询出参.........."+rts);
    		if(rt.length>3){
    			return "888888^"+rts+"^00^";
    		}else{
    			return "888888^"+rts+"^99^";
    		}
    	}
    	return "888888^传人交易码没有找到^99^";
    }
    
    /**
     * 绑卡
     * */
    public String bandingCard(String s){
    	String ss[]=s.split("\\|");
    	Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			st=con.createStatement();			
			st.executeUpdate("insert into ac01_ts(aae135,aac003,bze036,aae036,aae100) values('"+ss[0]+"','"+ss[1]+"',to_date('"+ss[2]+"','yyyymmdd'),sysdate,'1')");
			con.commit();
			return "ok";
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return e.getMessage();
		} finally{
			try {
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(st!=null  )
					st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(con != null && !con.isClosed())
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
    }
    
    /**
     * 解除绑卡
     * */
    public String unBandingCard(String s){
    	String ss[]=s.split("\\|");
    	Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			st=con.createStatement();			
			st.executeUpdate("delete from ac01_ts  where aae135= '"+ss[0]+"' and aae100='0'");//先删除无效的
			st.executeUpdate("update  ac01_ts set aae100='0' where aae135= '"+ss[0]+"' ");
			con.commit();
			return "ok";
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return e.getMessage();
		} finally{
			try {
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(st!=null  )
					st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(con != null && !con.isClosed())
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
    }
    
    public String getInfo(String s){
    	String[] ss=s.split("\\|");
    	String rts="研发中，敬请期待！";//返回内容
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
    	/*
    	Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			st=con.createStatement();		
			String qaac001 = "";// 根据身份证号和姓名查询出个人编号
			if(ss[0]!=null && !ss[0].equals("")){//身份证号不为空
				String qs="SELECT t1.aac001 aac001 FROM ac01 t1,ac02 t2 WHERE t1.aac001=t2.aac001 AND t2.aae140='31' AND t2.aac008='1' AND t1.aae135='"+ss[0]+"'";
				rs=st.executeQuery(qs);
				if(rs.next()){
					qaac001=rs.getString("aac001");//个人编号
				}
	    	}else{//使用社保卡号查询
	    		//根据社保卡查询ac01
	    		rs=st.executeQuery("select personno1 from sscard_pinfo where cardno='"+ss[1]+"'");
	    		if(rs.next()){
					qaac001=rs.getString("personno1");//个人编号
				}
	    	}
			rs.close();
			
			StringBuffer sb=new StringBuffer();
			sb.append("select kc60.aae072 as kc60_aae072,");
			sb.append("kc24.akb020 as kc24_akb020,");
			sb.append("kb01.akb021 as kb01_akb021,");
			sb.append("kc60.akc264 as kc60_akc264,");
			sb.append("kc60.ake034 as kc60_ake034,");
			sb.append("kc24.ake010 as kc24_ake010,");
			sb.append("kc24.aae017 as kc24_aae017");
			sb.append(" from kc24, kc60, kb01 ");
			sb.append(" where kc24.akb020 = kc60.akb020 ");
			sb.append(" and kc24.akb020 = kb01.akb020 ");
			sb.append(" and kc24.akc190 = kc60.akc190 ");
			sb.append(" and kc24.aae072 = kc60.aae072 ");
			sb.append(" and kc24.bka135 = '1' ");
			sb.append(" and kc24.bkc380 = '0' ");
			sb.append(" and nvl(kc60.akc264, 0) <> '0' ");
			sb.append(" AND KC24.AAC001 ='"+qaac001+"'");
			sb.append(" AND to_char(kc24.ake010,'yyyymmdd')>='"+ss[2]+"' ");
			sb.append(" AND to_char(kc24.ake010,'yyyymmdd')<='"+ss[3]+"' ");
			sb.append(" order by kc24.ake010 desc");
		    rs=st.executeQuery(sb.toString());
		    System.out.println(sb);
		    while(rs.next()){
		    	rts=rts+rs.getString("kb01_akb021")+"|"+rs.getString("kc60_akc264")+"|"+rs.getString("kc60_ake034")+"|"+sdf.format(rs.getTimestamp("kc24_ake010"))+"$";
		    }   
			return rts;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return e.getMessage();
		} finally{
			try {
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(st!=null  )
					st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(con != null && !con.isClosed())
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		*/
    	return rts;
    }

}
