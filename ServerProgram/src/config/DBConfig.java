package config;

public interface DBConfig {

	// public final 생략
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SERVER_USER";
	String password = "1111";
}
