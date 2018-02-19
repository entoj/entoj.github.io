# Templating

All the templates for patterns are written with the [nunjucks](https://mozilla.github.io/nunjucks/templating.html) template engine (similar to Jinja and Twig). The main benefit of nunjucks is that it is easily customizable via [filters](https://mozilla.github.io/nunjucks/api.html#custom-filters) and [custom tags](https://mozilla.github.io/nunjucks/api.html#custom-tags). 

The base system comes with [a couple of filters](Filters.md) that will help you build cms independant patterns while allowing you to export them to different target systems.


## Patterns

Patterns are created by providing a nunjucks macros that render the patterns as html. Macros allow you to provide parameters to your patterns.

{% hint style='tip' %}With parameters it's quite easy to encapsulate variations of patterns.{% endhint %}

- multiple macros per pattern
- main macro = entity id
- auto includes
- models
- examples


Entoj expects at least one macro that should be named like the directory it is living in. 

/site
    /atoms
        /a-cta
            /a-cta.j2 contains a macro a_cta


**Example:**
[import, lang="django"](files/a-text.j2)

**Usage:**
[import, lang="django"](files/a-text-example.j2)

Nunjucks even allows you to create patterns that "wrap" other patterns. 

**Example:**
[import, lang="django"](files/a-link.j2)

**Usage:**
[import, lang="django"](files/a-link-example.j2)

As you may have noticed the macro parameters are documented with jsdoc. This allows entoj to parse the macros and provide the gathered meta data to interested plugins like exporters or the gui. 


## Layouts



## Pages

Pages are used to create mockup pages consisting of a layout and your patterns.

**Example:**
[import, lang="django"](files/p-example.j2)
