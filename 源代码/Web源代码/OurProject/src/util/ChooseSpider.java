package util;

public class ChooseSpider {

	String websites[]={
 "http://www.cqzb.com/ciiccms/cqztb/category/zfcg/zfcg_cgjggg/list.html", 
 "http://www.ddkggzy.com/lbWeb/n_newslist_lmall.aspx?Item=list002", 
 "http://spb.cq.gov.cn/SPB_ClassArticleList_Index.asp?ClassID=1814", 
 "http://jyzx.beibei.gov.cn/cqbbwz/002/002002/002002004/", 
 "http://www.ybggb.com.cn/cqybwz/jyxx/001004/001004009/MoreInfo.aspx?CategoryNum=1004009", 
 "http://www.qjdtc.com/html/zfcg/zfcgzbgs/", 
 "http://www.jjqjyzx.com/www/site/site_index_130_0.shtml", 
 "http://www.cqhcjy.com/lbWeb/n_newslist_zz_item.aspx?Item=200011", 
 
			};
	//传入的参数为网址
	//返回爬虫名称，如果网址对于的爬虫不存在就返回null
	public String chooseSpider(String website){
		
		String result=null;   //作为返回结果
		website = website.replace("\r\n","");
		
		
		int i=searchSite(website);
		switch(i){
		case 0: result="cqzh"; break; 
		case 1: result="cqddk"; break; 
		case 2: result="cqspider1"; break; 
		case 3: result="cqbb"; break; 
		case 4: result="cqyb"; break; 
		case 5: result="QjSpider"; break; 
		case 6: result="cqjj"; break; 
		case 7: result="cqhc"; break; 
		default : result=null; break; 
		}
		return result;
	}
	
	
	//下面函数的作用为根据网址，在websites寻找该网址的存储位置
	//如果在websites不存在要寻找的网址，就返回-1
	public int searchSite(String website){
		
		//下面对websites进行遍历
		for(int i=0;i<websites.length;i++){
			
			if(websites[i].equals(website)){
				
				return i;   //如果找到，就返回该网址的位置i
			} 
		}
		
		
		return -1;   //如果没有找到，就返回-1
		
	}
}
