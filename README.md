Multilingual Theme for Nanoc
============================

[Nanoc](http://nanoc.ws/) is a static website generator. This repository contains a nanoc theme with
the following key features:

* Create bilingual Website with German and English variants
  - See lib/helpers/localization.rb if you need other languages
  - Extension to more than two language variants would be possible to achieve with medium effort
* Use [Pandoc's markdown dialect](http://johnmacfarlane.net/pandoc/) to create content sites
* Filters to import text from file and create table of contents
* One horizontal navigation bar on top of the site
* Uses HTML5 objects
* Optional module to create a simple blog
* Implements basic accessibility features
* Compatible to Nanoc4 in legacy mode

For the installation of nanoc, visit http://nanoc.ws/install/.

Minimal instructions

The theme needs the following gems:

```
$ gem install --user-install rake nanoc adsf pandoc-ruby listen iconv builder stringex nokogiri w3c_validators
```

And the local path to the gems must be added to the bin paths. This is shell specific. Example for
zsh:

```
$ vim ~/.zshrc
[...]
# local ruby gem binary folder
if which ruby >/dev/null && which gem >/dev/null; then
    gem_path=$(gem env gempath | cut -d ':' -f1)/bin
    if [ -d "$gem_path" ] ; then
        PATH="$gem_path:$PATH"
    fi
fi
[...]
```

Log out and in again to apply changes.

Then clone this repository

```
$ git clone https://github.com/scheibler/nanoc-multilingual-theme.git
```

Lastly, rename files and folder:

```
cd nanoc-multilingual-theme
mv content.example content
mv nanoc.yaml.example nanoc.yaml
mv rules.example rules
```

To create a new blog article use:

```
rake new_post "Deutscher Artikelname" "English article name"
```

The theme should be self-explanatory. For further information see nanoc's documentation at
http://nanoc.ws/docs/.

