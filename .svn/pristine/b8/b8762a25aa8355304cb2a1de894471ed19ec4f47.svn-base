package com.neusoft.server.socket;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class SocketClient {
	/**
	 * 发送报文
	 * 
	 * @param ip 请求ip地址
	 * @param port 请求端口
	 * @param charset 请求字符集
	 * @param s 报文内容
	 * @param type 是否添加长的 1添加 
	 * **/
	public static String sendSocket(String ip,int port,String charset,String s,String type) {
		// 调用哈行socket接口
		Socket socket = null;
		OutputStream outs = null;
		InputStream ins = null;
		System.out.println("执行socket中，，，，，，，，，，，，，，，，，");
		try {
			System.out.println("连接外部ip" + ip +":"+port+ "成功！！！");
			socket = new Socket(ip, port);
			System.out.println("连接外部socket端口" + port + "成功！！！");

			byte[] out = s.getBytes(charset);// 发送报文字节
			int le = out.length;// 字节长度
			String les = le + "";// 长度变成string
			int qs = 6 - les.length();// 共6位缺少的位数
			for (int i = 0; i < qs; i++) {
				les = "0" + les;// 前位补0
			}
			if(type.equals("1")){
				s = les + s;// 将长度加入报文前
			}
			outs = socket.getOutputStream();
			outs.write(s.getBytes(charset));
			System.out.println("发送成功！！！"+s);
			// 等待返回结果
			ins = socket.getInputStream();
			int firstChar = ins.read();
			int length = ins.available();
			byte[] bb = new byte[length + 1];
			bb[0] = (byte) firstChar;
			ins.read(bb, 1, length);
			String rts = new String(bb, charset);
			System.out.println("返回---"+rts);
			return rts;
		} catch (Exception e) {
			e.printStackTrace();
			return e.getLocalizedMessage();
		} finally {
			try {
				ins.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				outs.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				socket.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
