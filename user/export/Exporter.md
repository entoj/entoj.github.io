# Artefact exporter {#Export}

One of the main goals of entoj is to make the transfer of design systems to content management systems as easy as possible. Ideally this should work fully automated.

This is where the artefact exporters come into play: they take the templates you write for all the patterns, pages and templates and transform them into something the target plattform understands. Currently there are exporters for HTML, WordPress (PHP), TWIG, Typo3 (Fluid) and CoreMedia (JSP).

**Example:**
```jinja
{% macro e_quote_test(text, author, skin) %}
    {% set moduleClass = 'e-quote' %}
    {% set moduleClasses = [skin]|moduleClasses(moduleClass) %}
    <blockquote class="{{ moduleClasses }}">
        <span class="{{ moduleClass }}__text">„{{ text }}“</span>        
        <span class="{{ moduleClass }}__author">{{ author }}</span>
    </blockquote>
{% endmacro %}
```

could be exported as HTML

```html
    <blockquote class="e-quote">
        <span class="e-quote__text">„42“</span>        
        <span class="e-quote__author">Deep Thought</span>
    </blockquote>
```


## Configuration

### Module Configuration {#ModuleConfiguration}

Exporters may be configured globally and environment specific.

#### Global

Global configurations are located in the settings section of the entoj configuration

**Example:**
```javascript
// Changing the default export path
configuration.settings.add(
    {
        html:
        {
            exportPath: '${cache}/html'
        }
    });
```

#### Environment

Environment specific configurations are located in the respective build configuration

**Example:**
```javascript
// Change the export path only for the staging environment
configuration.build.environments.add(
    {
        staging =
        {
	        html:
	        {
                exportPath: '${cache}/staging'
            }
        }
	}};
```

### Export Configuration {#ExportConfiguration}

To export a entity you need to create a entity.json file in the root directory of a entity (e.g. `base/atoms/a-link/entity.json`) and add a export section. Within that section you can configure each exporter seperatly. For the examples below we will use the html exporter. 

#### Export

For each item in `export.<Exporter>[]` a artefact will be exported. You may configure each export with exporter specific options.

{% hint style='tip' %}Use global settings to minify repetition of configs{% endhint %}

**Example:**
```javascript
// Export the entity as example.html and a specific argument for the macro
{
	"export":
	{
        "html":
        [
            {
                "filename": "example.html",
                "arguments":
                {
                    "text": "Lorem ipsum"
                }
            }
        ]
	}
}
```


#### Global

To configure the default settings of a entity you can add a `export.settings.<Exporter>` section. Those settings are global and therefore used whenever the macro is part of an export.

{% hint style='tip' %}Local settings will override global settings{% endhint %}

**Example:**
```javascript
// Export the entity two times and with the argument text set to "Lorem Ipsum"
{
	"export":
	{
        "settings":
        {
            "html":
            {
                "arguments":
                {
                    "text": "Lorem ipsum"
                }                             
            }
        },
        "html":
        [
            {
                "filename": "example1.html"
            },
            {
                "filename": "example2.html"
            }            
        ]
	}
}
```


#### Macro

When a entity is composed out of other entities you can configure the rendering of those composed entities per export by adding a `export.<Exporter>[].settings.<Macro Name>` section for a local override. If you need to make the override global you can add a `export.globals.<Exporter>.settings.<Macro Name>` section.

**Example:**
```javascript
// Export the entity as example.html and adds the argument classes 
// with the value "super-special" to all calls to a_link.
// Additonally a_cta will get rendered with classes set to "super-cta"
{
	"export":
	{
        "globals":
        {
            "html":
            {
                "settings":
                {
                    "a_cta": 
                    {
                        "arguments":
                        {
                            "classes": "super-cta"
                        }
                    }
                }                                
            }
        },        
        "html":
        [
            {
                "filename": "example.html",
                "settings":
                {
                    "a_link": 
                    {
                        "arguments":
                        {
                            "classes": "super-special"
                        }
                    }
                }
            }
        ]
	}
}
```

