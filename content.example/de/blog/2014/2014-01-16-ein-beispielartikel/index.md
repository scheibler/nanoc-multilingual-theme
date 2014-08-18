---
title: "Ein Beispielartikel"
kind: article
created_at: 2014-01-16 01:55
canonical_identifier: 201401160155
tags:
- Tag Eins
- Tag Zwei
- Tag Drei
---

Der einleitende Satz steht auf der Artikelübersichtsseite.

<!-- more -->

<!-- toc -->

## Pandoc Markdown ##

Ein paar Beispiele für den Makrdown Dialekt "Pandoc"

### Paragraphen und Listen ###

Dies ist ein Paragraph.

* Listenobjekt 1
* Listenobjekt 2
* Listenobjekt 3

### Tabellen ###

Ein Beispiel für eine Tabelle:

Spalte A    | Spalte B
------------|---------
abc         | 123
def         | 456
ghi         | 789

### Links ###

Die vollständige Liste der möglichen Befehle gibt's
[hier](http://johnmacfarlane.net/pandoc/README.html).


## Inhalt aus Textdatei importieren ##

Hier wird der Inhalt einer Textdatei importiert:

<%= include_text_from_file /downloads/include_me.sh %>

Leerzeile davor und danach nicht vergessen.

Siehe lib/filters/include_text_from_file.rb.

