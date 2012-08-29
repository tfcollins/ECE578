import collections
from collections import Counter
with open('hw1.txt', 'r') as f:
	read_data = f.read()
f.closed
rm=","
read_data=filter(lambda x: not (x in rm), read_data)
read_data=read_data[296:1948].lower()
#print read_data

counts = collections.defaultdict(int)
for letter in read_data:
	counts[letter]+=1

hist = dict( (k, float(v)/len(read_data)) for k,v in counts.iteritems())
print hist
occur=list(hist.items())

from operator import itemgetter, attrgetter
occur_sort=sorted(occur, key=itemgetter(1))
del occur_sort[-1]
del occur_sort[-14]
print occur_sort

letters='ETAOINSRHDLUCMFYWGPBVKXQJZ'

for i in range(0,26):
	print "Plain: ",letters[i]," | Cipher: ",occur_sort[len(occur_sort)-1-i][0]

read_data=list(read_data)
for i in range(0,len(read_data)):
	for j in range(0,26):
		if read_data[i]==occur_sort[len(occur_sort)-1-j][0]:
			#print read_data[i]
			read_data[i]=letters[j].lower()	


print "".join(read_data)
