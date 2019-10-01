package bean;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;



import javax.swing.JOptionPane;

public class DBJavaBean {
	private String driverName = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/bookshop";
	private String user = "root";
	private String password = "123456";
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	public Statement getStmt() {
		return stmt;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public Statement getStatement() {
	
		try {
			// 1.注册驱动
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2.获取数据的连接对象
			Connection con = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/bookshop?serverTimezone=Asia/Shanghai", "root", "123456");
			return con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
		} catch (Exception e) {
			e.printStackTrace();
			message("无法连接服务器！");
			return null;
		}
	}
	
	/*public Statement getStatement() {
		try {
			Class.forName(getDriverName());
			con = DriverManager.getConnection(getUrl(), getUser(),
					getPassword());
			return con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
		} catch (Exception e) {
			e.printStackTrace();
			message("无法连接服务器！");
			return null;
		}
	}*/

public ResultSet selectResultSet(String sql) {
		try {
			stmt = getStatement();
			return stmt.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
			message("无法查询信息！");
			return null;
		}
	}

	public boolean updateResultSet(String sql) {
		try {
			stmt=getStatement();
			stmt.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			message("无法插入信息！");
			return false;
		}
	}

	public void message(String msg) {
		int type = JOptionPane.YES_NO_OPTION;
		String title = "提示信息";
		JOptionPane.showConfirmDialog(null, msg, title, type);
	}
}

