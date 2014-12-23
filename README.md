# ScrapeSpeare

A collection of text for basic programming exercises and data mining.

There are currently two sources for the Shakespearean text:

1. [Jeremy Hylton](https://www.python.org/~jeremy/)'s public domain offering of the "[Web's first edition of the Complete Works of William Shakespeare](http://shakespeare.mit.edu/)".
2. [Folger Digital Texts](http://http://www.folgerdigitaltexts.org/), which generously provides the source code to its printed editions (sans annotations and other publisher-specific text) for download under a [Creative Commons Attribution-NonCommercial 3.0 Unported license](http://creativecommons.org/licenses/by-nc/3.0/deed.en_US).


## Contents

- In `/lib/scrapespeare`
  + `builder.rb` - (TODO: update location) Parses and builds other forms from the mirrored site 
- In `/data-hold`:
  + `/src`
    + `shakespeare.mit.edu` - this is a straight up mirror of [Hylton's Shakespeare collection](http://shakespeare.mit.edu/) using: 

          wget --mirror --wait=1 http://shakespeare.mit.edu/
  
    + `folgerdigitaltexts.org` - a manual download of the PDF and XML zips found at [folgerdigitaltexts.org/download.html](http://www.folgerdigitaltexts.org/download.html)
