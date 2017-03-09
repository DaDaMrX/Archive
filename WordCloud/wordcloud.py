from os import path
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt

from wordcloud import WordCloud, STOPWORDS

d = path.dirname(__file__)
text = open(path.join(d, 'c++.txt')).read()
alice_mask = np.array(Image.open(path.join(d, "mask.png")))

stopwords = set(STOPWORDS)
stopwords.add("said")

wc = WordCloud(background_color="white", max_words=2000, mask=alice_mask,stopwords=stopwords)
wc.generate(text)
wc.to_file(path.join(d, "wordcloud.png"))

plt.imshow(wc)
plt.axis("off")
plt.figure()
plt.imshow(alice_mask, cmap=plt.cm.gray)
plt.axis("off")
plt.show()
