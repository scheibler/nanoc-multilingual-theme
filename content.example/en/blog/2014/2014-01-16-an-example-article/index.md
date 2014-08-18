---
title: "An example article"
kind: article
created_at: 2014-01-16 01:55
canonical_identifier: 201401160155
tags:
- Tag one
- Tag two
- Tag three
---

This introductory sentence is shown at the blog article list.

<!-- more -->

<!-- toc -->

## Pandoc Markdown ##

Some examples for the markdown dialect "Pandoc".

### Paragraphs and lists ###

This is a paragraph.

* List object 1
* List object 2
* List object 3

### Tables ###

A table example:

Column A    | Column B
------------|---------
abc         | 123
def         | 456
ghi         | 789

### Links ###

A list of all possible commands can be found [here](http://johnmacfarlane.net/pandoc/README.html).


## Import contents from text file ##

The content of a text file is imported here:

<%= include_text_from_file /downloads/include_me.sh %>

Don't miss the empty line before and after the command.

Code at lib/filters/include_text_from_file.rb.

