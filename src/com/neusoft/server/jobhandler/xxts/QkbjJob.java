package com.neusoft.server.jobhandler.xxts;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.neusoft.server.socket.SocketClient;
import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.IJobHandler;
import com.xxl.job.core.handler.annotation.JobHander;
import com.xxl.job.core.log.XxlJobLogger;

@JobHander(value="qkbjJob")
@Service
public class QkbjJob extends IJobHandler{
	public String ip;
	public int port;
	public String charset;
	
	@Autowired
	@Qualifier("hrbsi")
	private ComboPooledDataSource dataSource;
	public void setDataSource(ComboPooledDataSource dataSource) {
		this.dataSource = dataSource;
	}
	public ComboPooledDataSource getDataSource() {
		return dataSource;
	}

	/**
	 * 获取connection对象
	 * */
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	
	@Override
	public ReturnT<String> execute(String... param) throws Exception {
		
		if(param.length!=3){
			XxlJobLogger.log("入参个数不正确。");
			return ReturnT.FAIL;
		}
		this.ip=param[0];
		this.port=Integer.parseInt(param[1]);
		this.charset=param[2];
		
		String rts=run();
		
		if(rts.equals("ok")){
			return ReturnT.SUCCESS;
		}else{
			XxlJobLogger.log(rts);
			return ReturnT.FAIL;
		}
	}
	

	public String run(){
		System.out.println("欠款补缴推送");
		String rtsval="ok";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		// //////////////
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			/**
			 * 1.ResultSet.TYPE_SCROLL_INSENSITIVE
			 * 双向滚动，但不及时更新，就是如果数据库里的数据修改过，并不在ResultSet中反应出来。
			 * 2.ResultSet.TYPE_SCROLL_SENSITIVE
			 * 双向滚动，并及时跟踪数据库里的更新,以便更改ResultSet中的数据。 3.ResultSet.CONCUR_READ_ONLY
			 * 只读取ResultSet 4.ResultSet.CONCUR_UPDATABLE 用ResultSet更新数据库
			 * **/
			st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			//首先查询出一个进程id
			rs=st.executeQuery("select SEQ_TS_PID.Nextval pid from dual");
			rs.next();
			String pid=rs.getString("pid");//进程id标记是否为本进程执行的
			
			int tscount = st.executeUpdate("update ts_qkbj set uptype='2' ,pid='"+pid+"' where uptype='0'");// 首先将没有推送的设置为将要推送
			con.commit();
			rs.close();
			if (tscount != 0) {// 有需要推送的，每推送一条设置一条已推送
				rs = st.executeQuery("select aae135,money,uptype,return from ts_qkbj where uptype='2' and pid='"+pid+"'");
				while (rs.next()) {
					// xxts@0002^222722199901011121|张三|人民同泰|54|100|46|20170201112343
					StringBuffer sb = new StringBuffer();
					sb.append("xxts@0002^");
					sb.append(rs.getString("aae135")).append("|");
					sb.append(rs.getString("money"));
					String rts;
					try{
						rts = SocketClient.sendSocket(this.ip,this.port,this.charset,sb.toString(),"1");
					}catch(Exception e){
						e.printStackTrace();
						rts="欠款补缴报错了："+sb.toString()+"错误信息："+e.getMessage();
						System.out.println("欠款补缴报错了："+sb.toString()+"错误信息："+e.getMessage());
						rtsval=rts;
					}
					rs.updateString("uptype", "1");// 将上传标志改为1
					rs.updateString("return", rts);// 返回结果
					rs.updateRow();
					con.commit();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			rtsval=e.getMessage();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (st != null)
					st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (con != null && !con.isClosed())
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rtsval;
	}

}
