# N-Grams-Cymraeg-Welsh-N-Grams

To create the n-grams, the Corpws Cenedlaethol Cymraeg Cyfoes (CorCenCC) was first normalised: the text was transformed to lowercase, all characters that were not lowercase letters (e.g. punctuation, html tags, emojis) were converted to spaces, and all adjacent whitespace was collapsed to a single space character. Preceding and subsequent spaces were removed, ensuring the sentences begin and end with characters. A 'view' of the resulting sentence, N characters wide, was then made for each position in the sentence (for a sentence "mae'n iawn", the 3-grams would be -ma,mae,ae-,e-n,-n-,n-i,-ia,iaw,awn,wn- where hyphens represent spaces). Instances of each n-gram were then counted for the dataset and ranked according to frequency of occurences.

Use the included Bash script to generate n-gram .CSVs from data, from 1-grams to 4-grams.
