
# coding: utf-8

# In[84]:


from bs4 import BeautifulSoup
import urllib3 as url
import certifi as cert

# TODO 
# put all this into one function...

def get_stock_price(name):
    http = url.PoolManager(cert_reqs='CERT_REQUIRED', ca_certs=cert.where())
    html_doc = http.request('GET', 'https://finance.yahoo.com/quote/' + name + '?p=' + name)
    soup = BeautifulSoup(html_doc.data, 'html.parser')
    return soup.find("span", class_="Trsdu(0.3s) Fw(b) Fz(36px) Mb(-4px) D(ib)").get_text()

def get_prev_close(name):
    http = url.PoolManager(cert_reqs='CERT_REQUIRED', ca_certs=cert.where())
    html_doc = http.request('GET', 'https://finance.yahoo.com/quote/' + name + '?p=' + name)
    soup = BeautifulSoup(html_doc.data,"lxml")
    item = soup.select("div span[data-reactid*='35']")[1].text
    return (' '.join(item.split()))

# DNE
# def get_open(name):
#     http = url.PoolManager(cert_reqs='CERT_REQUIRED', ca_certs=cert.where())
#     html_doc = http.request('GET', 'https://finance.yahoo.com/quote/' + name + '?p=' + name)
#     soup = BeautifulSoup(html_doc.data,"lxml")
#     item = soup.select("div span[data-reactid*='35']")[1].text
#     return (' '.join(item.split()))

def string_to_num(name):
    stockVal = get_stock_price(name)
    return (round( float(stockVal),2 ))


# In[85]:


print(get_prev_close('SMPIX'))

