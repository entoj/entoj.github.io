{% set configName = 'cm' %}

# CoreMedia exporter

A CoreMedia (CM) jsp artifact exporter that is based on the [JSP exporter](JspExporter.md) - it inherits all behaviors for standard jsp files and extends it with CM specific requirements. 

The exporter will use the underlying JSP exporter when the entity does not have a valid [CoreMedia type](#type) configured.

All configured entities will export their templates as single jsp files with macro calls transformed to jsp/cm:includes.


## Feature Support {#FeatureSupport}

### Yield macros

Macros calls with custom body content like
```jinja
{% raw %}{% call macro() %}
    <p>STUFF</p>
{% endcall %}{% endraw %}
```
are supported by automatically inlining the called macro.


### Filters

The table below shows which core nunjucks filters are supported. For details about each filter see [the templating documentation](/user/templating/Filter.md).

Filter | Supported | Details
:------|:---------:|:-------
[AssetUrlFilter](/user/templating/Filter.md#AssetUrlFilter) | ![](/assets/yes.png) | see [cm.assetBaseUrl](#cm.assetBaseUrl)
[AttributesFilter](/user/templating/Filter.md#AttributesFilter) | ![](/assets/yes.png) |
[DebugFilter](/user/templating/Filter.md#DebugFilter) | ![](/assets/yes.png) |
[EmptyFilter](/user/templating/Filter.md#EmptyFilter) | ![](/assets/yes.png) |
[FormatDateFilter](/user/templating/Filter.md#FormatDateFilter) | ![](/assets/yes.png) | uses fmt:formatDate to format the date. The default format is configured via configuration.settings.formats.date
[FormatNumberFilter](/user/templating/Filter.md#FormatNumberFilter) | ![](/assets/no.png) | 
[GetFilter](/user/templating/Filter.md#GetFilter) | ![](/assets/yes.png) |
[HyphenateFilter](/user/templating/Filter.md#HyphenateFilter) | ![](/assets/no.png) |
[LinkUrlFilter](/user/templating/Filter.md#LinkUrlFilter) | ![](/assets/yes.png) | uses cm:link to generate the link.
[LipsumFilter](/user/templating/Filter.md#LipsumFilter) | ![](/assets/no.png) |
[LoadFilter](/user/templating/Filter.md#LoadFilter) | ![](/assets/yes.png) |
[MarkdownFilter](/user/templating/Filter.md#MarkdownFilter) |![](/assets/no.png) |
[MarkupFilter](/user/templating/Filter.md#MarkupFilter) | ![](/assets/yes.png) | the content is just passed through
[MediaQueryFilter](/user/templating/Filter.md#MediaQueryFilter) | ![](/assets/yes.png) | the exporter will create a helper includes/helper/mediaQueries.jsp that contains a map of all known media query to name mappings
[ModuleClassesFilter](/user/templating/Filter.md#ModuleClassesFilter) | ![](/assets/yes.png) |
[NotEmptyFilter](/user/templating/Filter.md#NotEmptyFilter) | ![](/assets/yes.png) |
[SetFilter](/user/templating/Filter.md#SetFilter) | ![](/assets/yes.png) |
[SettingFilter](/user/templating/Filter.md#SettingFilter) | ![](/assets/no.png) |
[SvgUrlFilter](/user/templating/Filter.md#SvgUrlFilter) | ![](/assets/yes.png) | see [cm.svgBaseUrl](#cm.svgBaseUrl)
[SvgViewBoxFilter](/user/templating/Filter.md#SvgViewBoxFilter) | ![](/assets/yes.png) | the exporter will create a helper includes/helper/svgViewBoxes.jsp that contains a map of all known svg files with their viewboxes; see [cm.svgBasePath](#cm.svgBasePath)
[TranslateFilter](/user/templating/Filter.md#TranslateFilter) | ![](/assets/yes.png) | uses fmt:message to translate strings
[UniqueFilter](/user/templating/Filter.md#UniqueFilter) | ![](/assets/yes.png) |

### Export Types

Type | Supported | Details
:------|:---------:|:-------
[Patterns](Export.md#ExportTypePatterns) | ![](/assets/yes.png) |
[Pages](Export.md#ExportTypePages) | ![](/assets/yes.png) |
[Templates](Export.md#ExportTypeTemplates) | ![](/assets/yes.png) | Template blocks are translated to placements


## Install {#Install}

Install the node module
```bash
$ npm install --save entoj-export-cm
```

Register the module (in `entoj-configuration.js`)
```js
configuration.register(require('entoj-export-cm'));
```

## Configuration {#Configuration}

### Module Configuration {#ModuleConfiguration}

See [module options](#ModuleOptions) for a detailed documentation.

#### Global

**Example:**
```javascript
// Full featured Example
configuration.settings.add(
    {
        cm:
        {
            exportPath: '${cache}/export',
            jspBasePath: 'includes',
            jspBaseUrl: '/includes',
            assetBaseUrl: '/assets/base',
            svgBaseUrl: '/assets/base/icons',
            svgBasePath: '/base/global/assets/icons',
            imageBaseUrl: '/images',
            viewHelperUri: 'http://foo.com/bar',
            viewHelperNamespace: 'bar'
        }
    });
```

#### Environment

```javascript
// Full featured Example
configuration.build.environments.add(
    {
        staging =
        {
	        cm:
	        {
                exportPath: '${cache}/export',
                jspBasePath: 'includes',
                jspBaseUrl: '/includes',
                assetBaseUrl: '/assets/base',
                svgBaseUrl: '/assets/base/icons',
                svgBasePath: '/base/global/assets/icons',
                viewHelperUri: 'http://foo.com/bar',
                viewHelperNamespace: 'bar'
            }
        }
	}};
```

{% include 'shared/JspExporterGlobalOptions.md' %}


### Export Configuration {#ExportConfiguration}

I am assuming you already read the chapter about the basics of [export configurations](user/export/Exporter.md#ExportConfiguration).

```javascript
// Full featured Example
{
	"export":
	{
        "settings":
        {
            "cm":
            {
                "mode": "inline",
                "parameters": 
                {
                    "param": 
                    {
                       "value": "default",
                       "name": "param"
                    }
                }
            }
        },
        "cm":
        [
            {
                "macro": "name",
                "filename": "name",
                "parameters": 
                {
                    "param": 
                    {
                       "value": "default",
                       "name": "param"
                    }
                },
                "mode": "inline",
                "settings":
                {
                    "macro_name":
                    {
                        "arguments": 
                        {
                            "name": "value"
                        },
                        "mode": "inline"
                    }
                }
            }
        ]
	}
}
```

#### Filename generation

The artifact filenames are automatically generated from the template `<Namespace>/<Type>.<View>[<ViewVariant>]` where the `[<ViewVariant>]` part is optional. When the type includes a namespace it will be used as the directory name of exported artifact.

##### Type

The type of the entity bean can be configured by the `type` option. 

```javascript
{
    "export":
    {
        "cm":
        [
            {
                "type": "CMLinkable"
            }
        ]
    }
}
```

When not configured the documented type of the model parameter from the nunjucks macro is used:

```jinja
{##
    @param {CMTeasable} [model]
#}
{% macro e_example(model) %}
```

When the type can not be determined the exporter will fallback to the JSP exporter.

##### View

The view can be configured by the `view` option:

```javascript
{
    "export":
    {
        "cm":
        [
            {
                "view": "asModule"
            }
        ]
    }
}
```

When not configured the macro name with all `_` replaced by `-` will be used:

```jinja
{% macro e_example(model) %} => e-example
```

##### View Variant

The view variant can be configured by the `viewVariant` option:

```javascript
{
    "export":
    {
        "cm":
        [
            {
                "viewVariant": "article"
            }
        ]
    }
}
```

When not configured the view variant part will be completely skipped.

##### Full filename

The filename can be configured by the `filename` option:

```javascript
{
    "export":
    {
        "cm":
        [
            {
                "filename": "CMLinkable.asLink"
            }
        ]
    }
}
```

When a filename is configured all other options are ignored. If the filename is incomplete it will automatically be augmented with a path and/or file extension.


#### Options {#ExportOptions}

##### macro

* **Type:** `String`
* **Export:** Yes
* **Global:** No
* **Macro:** No
* **Default:** The main macro of the entity (e.g. a_text)

Defines the macro that will be exported.

##### type {#Type}

* **Type:** `String`
* **Export:** Yes
* **Global:** Yes
* **Macro:** No
* **Default:** model type from the macro docblock

Define the type of the underlying entity bean - this is used to generate export filenames. If not specified the docblock from the exported macro

##### view

* **Type:** `String`
* **Export:** Yes
* **Global:** Yes
* **Macro:** No
* **Default:** the macro name with all `_` replaced by `-`

Defines the view  - this is used to generate export filenames.

##### viewVariant

* **Type:** `String`
* **Export:** Yes
* **Global:** Yes
* **Macro:** No
* **Default:** ``

Defines the viewVariant  - this is used to generate export filenames.

##### filename

* **Type:** `String`
* **Export:** Yes
* **Global:** No
* **Macro:** No
* **Default:** `${includePath}/${categoryName}/${macroName}.jsp` or `${includePath}/${categoryName}/${entityId}.jsp`

Define the filename of the exported macro. The .jsp extensions is added automatically. When no path is specified the default path (the category plural name in lowercase) is prepended.

##### mode

* **Type:** `Enum[include|inline]`
* **Export:** No
* **Global:** Yes
* **Macro:** Yes
* **Default:** `include`

Defines if the macro will be included via jsp:include or inlined at the calling site.

##### parameters

* **Type:** `Array`
* **Export:** Yes
* **Global:** Yes
* **Macro:** No
* **Default:** `[]`

Allows to specify parameter default values for macros. This only applies to exporting full macros. If you want to change the arguments of a macro call please see  [arguments](#arguments)

##### arguments {#arguments}

* **Type:** `Array`
* **Export:** No
* **Global:** No
* **Macro:** Yes
* **Default:** `[]`

Allows to specify arguments that will be used when calling macros.