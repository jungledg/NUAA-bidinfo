package JavaBean;

import java.math.BigDecimal;

public class ProjectBean {

	private String project_name = null;
	private String project_bidder = null;
	private BigDecimal bid_money = null;
	private String bid_time = null;

	// 构造函数
	public ProjectBean() {
		// TODO Auto-generated constructor stub
	}

	// 带参数构造函数
	public ProjectBean(String project_name, String project_bidder,
			BigDecimal bid_money, String bid_time) {

		this.project_name = project_name;
		this.project_bidder = project_bidder;
		this.bid_money = bid_money;
		this.bid_time = bid_time;
	}

	// set方法组
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public void setProject_bidder(String project_bidder) {
		this.project_bidder = project_bidder;
	}

	public void setBid_money(BigDecimal bid_money) {
		this.bid_money = bid_money;
	}

	public void setBid_time(String bid_time) {
		this.bid_time = bid_time;
	}

	// get方法组
	public String getProject_name() {
		return project_name;
	}

	public String getProject_bidder() {
		return project_bidder;
	}

	public BigDecimal getBid_money() {
		return bid_money;
	}

	public String getBid_time() {
		return bid_time;
	}
}
