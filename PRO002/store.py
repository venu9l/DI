import xlsxwriter


class WebCrawler:
    
    def __init__(self,page):
        self.a = page.find_all('a')
        self.p = page.find_all('p')
        self.h1 = page.find_all('h1')
        self.h2 = page.find_all('h2')
        self.h3 = page.find_all('h3')
        self.h4 = page.find_all('h4')
        self.h5 = page.find_all('h5')
        self.h6 = page.find_all('h6')

    def Anchor(self):
        workbook = xlsxwriter.Workbook('id-rel.xlsx')
        bold = workbook.add_format({'bold': 1})
        
        a = workbook.add_worksheet('A Tags')
        p = workbook.add_worksheet('P Tags')

        a.write('A1', 'Link', bold)
        a.write('B1', 'classes', bold)
        a.write('C1', 'Text', bold)
        a.write('D1', 'Raw HTML', bold)
        row = 1
        col = 0
        for oa in self.a:
            if oa.has_attr("href"):
                a.write_string(row,col,oa.attrs["href"])
            else:
                a.write_string(row, col,'')
        
            if oa.has_attr("class"):
                a.write_string(row,col+1,unicode(oa.attrs["class"]))
            else:
                a.write_string(row, col+1,'')
        
            a.write_string(row,col+2,unicode(oa.text))        
            a.write_string(row,col+3,unicode(oa))
        
            row += 1
        
        p.write('A1', 'classes', bold)
        p.write('B1', 'Text', bold)
        p.write('C1', 'Raw HTML', bold)
        row = 1
        col = 0
        for oa in self.p:
            if oa.has_attr("class"):
                p.write_string(row,col,unicode(oa.attrs["class"]))
            else:
                p.write_string(row, col,'')
        
            p.write_string(row,col+1,unicode(oa.text))        
            p.write_string(row,col+2,unicode(oa))
        
            row += 1
        
        workbook.close()
