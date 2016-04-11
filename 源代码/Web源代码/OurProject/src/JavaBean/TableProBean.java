package JavaBean;

public class TableProBean {
	private String project_bidder = null;
	private String sum_bid_money = null;
	
	public TableProBean(String project_bidder,String sum_bid_money){
		this.project_bidder = project_bidder;
		this.sum_bid_money = sum_bid_money;
	}

	public String getProject_bidder() {
		return project_bidder;
	}

	public void setProject_bidder(String project_bidder) {
		this.project_bidder = project_bidder;
	}

	public String getSum_bid_money() {
		return sum_bid_money;
	}

	public void setSum_bid_money(String sum_bid_money) {
		this.sum_bid_money = sum_bid_money;
	}
}
