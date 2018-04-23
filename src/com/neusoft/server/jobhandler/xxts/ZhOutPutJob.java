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

@JobHander(value="zhOutPutJob")
@Service
public class ZhOutPutJob extends IJobHandler {
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
		
		System.out.println("-------------------------->"+param.length);
		
		if(param.length!=3){
			XxlJobLogger.log("入参个数不正确。");
			return ReturnT.FAIL;
		}
		this.ip=param[0];
		this.port=Integer.parseInt(param[1]);
		this.charset=param[2];
		
		String rts=run();
		String data[]=rts.split("\\^");
		if(data[0].equals("ok")){
			System.out.println(rts);
			XxlJobLogger.log("执行成功共推送："+data[1]+"条");
			return ReturnT.SUCCESS;
		}else{
			XxlJobLogger.log(rts);
			return ReturnT.FAIL;
		}
	}
	

	public String run(){
		System.out.println("账户支出推送");
		String rtsval="ok";
		// log.info("卡大厅入参-"+s);
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
			st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			//首先查询出一个进程id
			rs=st.executeQuery("select SEQ_TS_PID.Nextval pid from dual");
			rs.next();
			String pid=rs.getString("pid");//进程id标记是否为本进程执行的
			int tscount = st.executeUpdate("update ts_zhoutput set uptype='2',pid='"+pid+"' where uptype='0'");// 首先将没有推送的设置为将要推送并标记进程id
			rs.close();
			con.commit();
			if (tscount != 0) {// 有需要推送的，每推送一条设置一条已推送
				rs = st.executeQuery("select aae135,aac003,akb021,bkc105,bkc111,bkc112,aae036,uptype,return from ts_zhoutput where uptype='2' and pid='"+pid+"' and aae135 in(SELECT aae135 FROM ac01_ts where aae100='1')");
				while (rs.next()) {
					StringBuffer sb = new StringBuffer();
					sb.append("xxts@0001^");
					sb.append(rs.getString("aae135")).append("|");
					sb.append(rs.getString("aac003")).append("|");
					sb.append(rs.getString("akb021")).append("|");
					sb.append(rs.getString("bkc105")).append("|");
					sb.append(rs.getString("bkc111")).append("|");
					sb.append(rs.getString("bkc112")).append("|");
					sb.append(sdf.format(rs.getTimestamp("aae036")));
					String rts;
					try{
						rts = SocketClient.sendSocket(this.ip,this.port,this.charset,sb.toString(),"1");
					}catch(Exception e){
						e.printStackTrace();
						rts="账户支出报错了："+sb.toString()+"错误信息："+e.getMessage();
						System.out.println("账户支出报错了："+sb.toString()+"错误信息："+e.getMessage());
						rtsval="err^"+rts;
					}
					rs.updateString("uptype", "1");// 将上传标志改为1
					rs.updateString("return", rts);// 返回结果
					rs.updateRow();
					con.commit();
				}
				rtsval=rtsval+"^"+tscount;
			}
			rtsval=rtsval+"^0";
		} catch (Exception e) {
			e.printStackTrace();
			rtsval="err^"+e.getMessage();
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
