package net;

import java.io.InputStream;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * @author 박도성
 * 
 * 
 * **/

public class Server {

	public static void main(String[] args) {
		
		ServerSocket serverSocket = null;
		
		try {
			serverSocket = new ServerSocket();
			serverSocket.bind(new InetSocketAddress("127.0.0.1", 1234));
		
		
			while(true) {
				// 클라이언트 알아내기
				Socket socket = serverSocket.accept();
				InetSocketAddress isa = (InetSocketAddress) socket.getRemoteSocketAddress();
				
				// 서버 <---- 클라이언트
				InputStream is = socket.getInputStream();
				byte[] b = new byte[100];
				int readByte = is.read(b);	// 실제로 읽은 바이트 수 반환
				// byte[] -> String
				String message = new String(b,0, readByte);
				System.out.println("클라이언트 " + isa.getHostName() + "로부터 " + message + " 를 받았습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(!serverSocket.isClosed()) {
					serverSocket.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
