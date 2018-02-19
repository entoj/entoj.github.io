# Export

One of the main goals of entoj is to make the transfer of design systems to content management systems as easy as possible. Ideally this should work fully automated.

This is where the artefact exporters come into play: they take the templates you write for all the patterns, pages and templates and transform them into something the target plattform understands. Currently html, WordPress (PHP), Typo3 (Fluid) and CoreMedia (JSP) are supported. 


## Configuration

To export a entity you need to create a entity.json file in the root directory of a entity (e.g. `base/atoms/a-link/entity.json`) and add a export section. Within that section you can configure each exporter seperatly. For the examples below we will use the html exporter. 


### Exports

For each item in `export.<Exporter>[]` a artefact will be exported. You may configure each export with exporter specific options.

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

When a entity is composed out of other entities you can configure the rendering of those composed entities per export by adding a `export.<Exporter>[].macros.<Macro Name>` section. This settings are based on macro calls.

**Example:**
```javascript
// Export the entity as example.html and adds the argument classes 
// with the value "super-special" to all calls to a_link
{
	"export":
	{
        "html":
        [
            {
                "filename": "example.html",
                "macros":
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


### Global settings

To configure the default settings of a entity you can add a `export.globals.<Exporter>` section. Those settings are global and therefore used whenever the macro is part of an export.

{% hint style='tip' %}Local settings will override global settings{% endhint %}

**Example:**
```javascript
// Export the entity two times and with the argument text set to "Lorem Ipsum" 
// and all calls to a_link with the value "super-special" for classes
{
	"export":
	{
        "globals":
        {
            "html":
            {
                "arguments":
                {
                    "text": "Lorem ipsum"
                },
                "macros":
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
