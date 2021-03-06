# -*- coding: utf-8 -*-


import scrapy
import re
from scrapy.contrib.linkextractors import LinkExtractor
from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.http import Request

from cqspider.Filter import Filter
from cqspider.items import CqspiderItem
import sys
reload(sys)
sys.setdefaultencoding( "utf-8" )

class cqspider1(CrawlSpider):
    name = 'cqspider1'
    allowed_domains = ['spb.cq.gov.cn']
    start_urls = ['http://spb.cq.gov.cn/SPB_ClassArticleList_Index.asp?ClassID=1814&page=1']
    page = 1
    link_extractor = {
        'content' : SgmlLinkExtractor(allow=r'ArticleID=2\d+$'),
    }
    def parse(self, response):
        # content = response.xpath('//*[@class="articleTitleList01"]/text()').extract()
        # if content:
        #     self.page += 1
        #     m_url = 'http://spb.cq.gov.cn/SPB_ClassArticleList_Index.asp?ClassID=1814&page=%d' % (self.page)
        #     yield Request(url=m_url, callback=self.parse)
        #
        page_num = 0
        content = response.xpath('//a').extract()
        for i in content:
            if u'尾页' in i or u'末页' in i:
                re_str = '.*\d+'
                re_url = re.compile(re_str)
                re_url = re_url.findall(i)
                re_url = re.findall(r'\d+(?=$)',re_url[0].decode())
                page_num = int(re_url[0])
                print 'page_num = ',page_num

        print 'page_num = ',page_num
        while self.page < page_num:
            self.page += 1
            print 'page = ',self.page
            m_url = 'http://spb.cq.gov.cn/SPB_ClassArticleList_Index.asp?ClassID=1814&page=%d' % (self.page)
            yield Request(url=m_url,callback=self.parse_content)
        # for element in response.xpath('//td[@class="ArticleTitle1"]/a').extract():
        #
        #     element = element.encode('utf-8')
        #     pos = element.find('下一页')
        #     element = element.decode('utf-8')
        #     if pos > -1:
        #         cqspider1.page = cqspider1.page+1
        #         m_url = 'http://spb.cq.gov.cn/SPB_ClassArticleList_Index.asp?ClassID=1814&page=%d' % (cqspider1.page)
        #         print 'm_url=',m_url
        #         yield Request(url=m_url, callback=self.parse)
    def parse_content(self,response):
        for link in self.link_extractor['content'].extract_links(response):
            yield Request(url=link.url, callback=self.parse_page_content)

    def parse_page_content(self, response):
        item = CqspiderItem()
        content = response.xpath('//tbody').extract().pop()
        content = re.sub('<[^>]*>','',content)
        fil = Filter(content)

        item['project_name'] = fil.get_project_name()
        item['bid_name'] = fil.get_bid_name()
        item['bid_time'] = fil.get_bid_time()
        item['bid_money'] = fil.get_bid_money()
        print item['bid_time']
        return item
