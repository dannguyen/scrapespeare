# ScrapeSpeare

A collection of text for basic programming exercises and data mining. 

The end goal is to convert the different source texts into one uniform data format, such as JSON, and then building out various versions in plaintext, HTML, JSON for use in parsing and NLP exercises.

There are currently two sources for the Shakespearean text (found in the [data-hold/src] directory):

1. [Jeremy Hylton](https://www.python.org/~jeremy/)'s public domain offering of the "[Web's first edition of the Complete Works of William Shakespeare](http://shakespeare.mit.edu/)". The source text for Hylton's site comes from the Complete Moby(tm) Shakespeare.
2. [Folger Digital Texts](http://http://www.folgerdigitaltexts.org/), which generously provides the source code to its printed editions (sans annotations and other publisher-specific text) for download under a [Creative Commons Attribution-NonCommercial 3.0 Unported license](http://creativecommons.org/licenses/by-nc/3.0/deed.en_US).





## Contents

Note: The builder scripts are in a state of flux. I wouldn't try running them...yet...

- In `/lib/scrapespeare`
  + `mit`
    + `builder.rb` -  Parses and builds other forms from the mirrored HTML
  + `folgers`
    * `builder.rb` - Parses the XML 
- In `/data-hold`:
  + `/src`
    + `shakespeare.mit.edu` - this is a straight up mirror of [Hylton's Shakespeare collection](http://shakespeare.mit.edu/) using: 

          wget --mirror --wait=1 http://shakespeare.mit.edu/
  
    + `folgerdigitaltexts.org` - a manual download of the PDF and XML zips found at [folgerdigitaltexts.org/download.html](http://www.folgerdigitaltexts.org/download.html)
