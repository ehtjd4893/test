package net;

import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.Scanner;

public class Client {
	public static void main(String[] args) {
		
	
		Socket socket = null;
		
		try {
			socket = new Socket();
			socket.connect(new InetSocketAddress("127.0.0.1", 1234));
			Scanner sc = new Scanner(System.in);
			System.out.print("서버에 전송할 메세지 >>>");
			String message = sc.nextLine();
			
			// 서버 <--- 클라이언트
			// socket을 통해서 서버로 데이터를 보냄 (출력스트림 필요)
			OutputStream os = socket.getOutputStream();
			os.write(message.getBytes());
			os.flush();
			os.close();
			System.out.println("서버로 " + message + " 데이터를 전송했습니다.");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(!socket.isClosed()) {
					socket.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}		
		}
	}
}
