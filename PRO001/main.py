import requests
from bs4 import BeautifulSoup
from readability import Readability

response = requests.get('http://127.0.0.1/demo')

rtext = "The result is a number that corresponds with a U.S. grade level. The sentence, The Australian platypus is seemingly a hybrid of a mammal and reptilian creature is an 11.3 as it has 24 syllables and 13 words. The different weighting factors for words per sentence and syllables per word in each scoring system mean that the two schemes are not directly comparable and cannot be converted. The grade level formula emphasises sentence length over word length. By creating one-word strings with hundreds of random characters, grade levels may be attained that are hundreds of times larger than high school completion in the United States. Due to the formula's construction, the score does not have an upper bound."
robj = Readability(rtext)
html = response.text
obj = BeautifulSoup(html,'lxml')
def getTagCount(c):
    ct  = obj.find_all(c)
    print("Count of '"+c+"' Tag is :" + str(len(ct)))
    print ct

if response.status_code == 200:
    print('Connection Success!\n')
elif response.status_code == 404:
    print('Not Found.\n')

getTagCount('a')

#print len(rtext.split())
fk = robj.flesch_kincaid()
s = robj.smog()
print "\nFlesch Kincaid Readabiity Score : "+str(fk.score)
print "Flesch Kincaid Readabiity Grade Level : "+str(fk.grade_level)
#print "SMOG Readabiity Score : "+str(s.score)
#print "SMOG Readabiity Grade Level : "+str(s.grade_level)

