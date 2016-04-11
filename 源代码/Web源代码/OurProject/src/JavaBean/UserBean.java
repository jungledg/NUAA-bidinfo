package JavaBean;

public class UserBean {
	//账户类 
	
	private String username;  //账户名
	private String userpass;  //密码
	private String usertype;  //账户类型

	//构造函数(带参数)
	public UserBean(String username,String userpass,String usertype) {
		this.username = username;
		this.userpass = userpass;
		this.usertype=usertype;
	}
	
	//构造函数（不带参数）
	public UserBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {   
		this.username = username;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	
	public String getUsertype(){
		return usertype;
	}
	
	public void setUsertype(String usertype){
		this.usertype=usertype;
	}    
}
