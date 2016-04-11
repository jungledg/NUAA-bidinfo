package JavaBean;

public class sqlDeal {

	// 根据查询变量得到项目查询的sql
	public String sqldeal(String project_name, String project_bidder,
			String bid_money_min, String bid_money, String bid_money_max,
			String bid_time_min, String bid_time, String bid_time_max) {
		String sql = null;     

		StringBuffer sb = new StringBuffer();
		int flag = 0; // 标记sb语句状态，如果sb为"select * from bid_form where"，flag=0，否则为1

		sb.append("select * from bid_info where");

		if (project_name.equals("") == false) {
			// 假如项目名不是空，就将项目名加入到sql
			sb.append(" Project_Name like '%");
			sb.append(project_name);
			sb.append("%'");
			flag = 1; // 标记为置1
		}

		if (project_bidder.equals("") == false) {
			// 假如项目中标单位不是空，就将项目中标单位加入到sql

			if (flag == 1) {
				sb.append(" and Project_Bidder like '%");
			} else {
				sb.append(" Project_Bidder like '%");
			}
			sb.append(project_bidder);
			sb.append("%'");
			flag = 1; // 标记为置1
		}

		if (bid_money.equals("请输入中标金额") == false) {
			// 假如项目中标金额不是初始数据，就将项目中标金额加入到sql

			if (flag == 1) {
				sb.append(" and Bid_Money ='");
			} else {
				sb.append(" Bid_Money ='");
			}
			sb.append(bid_money);
			sb.append("'");
			flag = 1; // 标记为置1
		} else {
			// 只有当项目中标金额为空时，才能输入项目中标金额的上下限

			if (bid_money_min.equals("请输入中标金额下限") == false) {
				// 假如项目中标金额下限不是初始化的数据，就将项目中标金额下限加入到sql中

				if (flag == 1) {
					sb.append(" and Bid_Money>='");
				} else {
					sb.append(" Bid_Money>='");
				}
				sb.append(bid_money_min); 
				sb.append("'");
				flag = 1; // 标记为置1
			}

			if (bid_money_max.equals("请输入中标金额上限") == false) {
				// 假如项目中标金额下限不是初始化的数据，就将项目中标金额下限加入到sql中

				if (flag == 1) {
					sb.append(" and Bid_Money<='");
				} else {
					sb.append(" Bid_Money<='");
				}
				sb.append(bid_money_max);
				sb.append("'");
				flag = 1; // 标记为置1
			}
		}

		if (bid_time.equals("请输入中标时间") == false) {
			// 假如项目中标时间不是初始数据，就将项目中标时间加入到sql

			if (flag == 1) {
				sb.append(" and Bid_Time='");
			} else {
				sb.append(" Bid_Time='");
			}
			sb.append(bid_time);
			sb.append("'");
			flag = 1; // 标记为置1
		} else {
			// 只有当项目中标时间为空时，才能输入项目中标时间的上下限

			if (bid_time_min.equals("请输入中标时间下限") == false) {
				// 假如项目中标金额下限不是初始化的数据，就将项目中标金额下限加入到sql中

				if (flag == 1) {
					sb.append(" and Bid_Time>='");
				} else {
					sb.append(" Bid_Time>='");
				}
				sb.append(bid_time_min);
				sb.append("'");
				flag = 1; // 标记为置1 
			}

			if (bid_time_max.equals("请输入中标时间上限") == false) {
				// 假如项目中标金额下限不是初始化的数据，就将项目中标金额下限加入到sql中

				if (flag == 1) {
					sb.append(" and Bid_Time<='");
				} else {
					sb.append(" Bid_Time<='");
				}
				sb.append(bid_time_max); 
				sb.append("'");
				flag = 1; // 标记为置1
			}
		}
		sql = sb.toString();
		return sql;
	}
}
