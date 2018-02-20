{% from '/assets/macros.j2' import config_option as config_option %}

# JSP exporter

A jsp artefact exporter. All configured entities will export their templates as single jsp files. Any macro calls are resolved at runtime via jsp:include.

## Feature Support {#FeatureSupport}

### Yield macros

Macros calls with custom body content like
```jinja
{% call macro() %}
    <p>STUFF</p>
{% endcall %}
```
are supported by automatically inlining the called macro.


### Filter

The table below shows which core nunjucks filters are supported. For details about each filter see [the templating documentation](/user/templating/Filter.md).

Filter | Supported | Details
:------|:---------:|:-------
[AssetUrlFilter](/user/templating/Filter.md#AssetUrlFilter) | ![](/assets/yes.png) | see [jsp.assetBaseUrl](#jsp.assetBaseUrl)
[AttributesFilter](/user/templating/Filter.md#AttributesFilter) | ![](/assets/yes.png) |
[DebugFilter](/user/templating/Filter.md#DebugFilter) | ![](/assets/yes.png) |
[EmptyFilter](/user/templating/Filter.md#EmptyFilter) | ![](/assets/yes.png) |
[FormatDateFilter](/user/templating/Filter.md#FormatDateFilter) | ![](/assets/yes.png) | uses fmt:formatDate to format the date. The default format is configured via configuration.settings.formats.date
[FormatNumberFilter](/user/templating/Filter.md#FormatNumberFilter) | ![](/assets/no.png) | 
[GetFilter](/user/templating/Filter.md#GetFilter) | ![](/assets/yes.png) |
[HyphenateFilter](/user/templating/Filter.md#HyphenateFilter) | ![](/assets/no.png) |
[LinkUrlFilter](/user/templating/Filter.md#LinkUrlFilter) | ![](/assets/yes.png) | uses c:url to generate the link.
[LipsumFilter](/user/templating/Filter.md#LipsumFilter) | ![](/assets/no.png) |
[LoadFilter](/user/templating/Filter.md#LoadFilter) | ![](/assets/yes.png) |
[MarkdownFilter](/user/templating/Filter.md#MarkdownFilter) |![](/assets/no.png) |
[MarkupFilter](/user/templating/Filter.md#MarkupFilter) | ![](/assets/yes.png) | the content is just passed through
[MediaQueryFilter](/user/templating/Filter.md#MediaQueryFilter) | ![](/assets/yes.png) | the exporter will create a helper includes/helper/mediaQueries.jsp that contains a map of all known media query to name mapings
[ModuleClassesFilter](/user/templating/Filter.md#ModuleClassesFilter) | ![](/assets/yes.png) |
[NotEmptyFilter](/user/templating/Filter.md#NotEmptyFilter) | ![](/assets/yes.png) |
[SetFilter](/user/templating/Filter.md#SetFilter) | ![](/assets/yes.png) |
[SettingFilter](/user/templating/Filter.md#SettingFilter) | ![](/assets/no.png) |
[SvgUrlFilter](/user/templating/Filter.md#SvgUrlFilter) | ![](/assets/yes.png) | see [jsp.svgBaseUrl](#jsp.svgBaseUrl)
[SvgViewBoxFilter](/user/templating/Filter.md#SvgViewBoxFilter) | ![](/assets/yes.png) | the exporter will create a helper includes/helper/svgViewBoxes.jsp that contains a map of all known svg files with their viewboxes; see [jsp.svgBasePath](#jsp.svgBasePath)
[TranslateFilter](/user/templating/Filter.md#TranslateFilter) | ![](/assets/yes.png) | uses fmt:message to translate strings
[UniqueFilter](/user/templating/Filter.md#UniqueFilter) | ![](/assets/yes.png) |


## Install {#Install}

Install the node module
```bash
$ npm install --save entoj-export-jsp
```

Register the module (in `entoj-configuration.js`)
```js
configuration.register(require('entoj-export-jsp'));
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
        jsp:
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
	        jsp:
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

#### Options {#ModuleOptions}

##### jsp.exportPath {#jsp.exportPath}

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `${cache}/export`

The base path used to store all exported artefacts. Standard directories may be used as variables.


##### jsp.jspBasePath

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `includes`

The base path used to store exported jsp artefacts. This is relative to [jsp.exportPath](#jsp.exportPath).


##### jsp.jspIncludePath

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `/includes`

The base url used to include jsp artefacts via jsp:include.


##### jsp.imageBaseUrl

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base url for rendering |imageUrl filters.


##### jsp.assetBaseUrl

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base url for rendering |assetUrl filters.


##### jsp.svgBaseUrl

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base url for rendering |svgUrl filters.


##### jsp.svgBasePath

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base path for reading svg icons needed to render |svgViewBox filters.


##### jsp.viewHelperUri

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `https://entoj.io/entoj`

Used as the uri for the main view helper registration.


##### jsp.viewHelperNamespace

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `entoj`

Used as the namespace for the main view helper registration.


### Export Configuration {#ExportConfiguration}

I am assuming you already read the chapter about the basics of [export configurations](user/export/Exporter.md#ExportConfiguration).

```javascript
// Full featured Example
{
	"export":
	{
        "settings":
        {
            "jsp":
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
        "jsp":
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

#### Options {#ExportOptions}

##### macro

* **Type:** `String`
* **Export:** Yes
* **Global:** No
* **Macro:** No
* **Default:** The main macro of the entity (e.g. a_text)

Defines the macro that will be exported.


##### filename

* **Type:** `String`
* **Export:** Yes
* **Global:** No
* **Macro:** No
* **Default:** `${includePath}/${categoryName}/${macroName}.jsp` or `${includePath}/${categoryName}/${entityId}.jsp`

Define the filename of the exported macro. The .jsp extensions is added automatically. When no path is specified the default path (the categroy plural name in lowercase) is prepended.


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


## Cookbook {#Cookbook}

Below you will find a couple of examples to illustrate most of the configuration scenarios you will face in your daily work.

### Templates
All examples below are based on the following template files:

#### base/atoms/a-text/a-text.j2
[import, lang="jinja"](jsp-files/a-text.j2)

#### base/molecules/m-imagetext/m-imagetext.j2
[import, lang="jinja"](jsp-files/m-imagetext.j2)


### Default export

#### Configs
##### base/atoms/a-text/entity.json
[import](jsp-files/standard.json)

#### Exported
##### includes/atoms/a-text.jsp
[import, lang="html"](jsp-files/standard.jsp)


### Custom filenames

#### Configs
##### base/atoms/a-text/entity.json
[import](jsp-files/filename.json)

#### Exported
##### includes/atoms/custom.jsp
[import, lang="html"](jsp-files/standard.jsp)

##### includes/utils/custom.jsp
[import, lang="html"](jsp-files/standard.jsp)


### Changing default values of parameters

#### Configs
##### base/atoms/a-text/entity.json
[import](jsp-files/parameters.json)

#### Exported
##### includes/atoms/a-text.jsp
[import, lang="html"](jsp-files/parameters.jsp)


### Inlining macros {#ExampleInline}

#### Configs
##### base/molecules/m-imagetext/entity.json
[import](jsp-files/inline.json)

#### Exported
##### includes/molecules/include.jsp
[import, lang="html"](jsp-files/include.jsp)

##### includes/molecules/inline.jsp
[import, lang="html"](jsp-files/inline.jsp)


### Changing argument values of called macros

#### Configs
##### base/molecules/m-imagetext/entity.json
[import](jsp-files/arguments.json)

#### Exported
##### includes/molecules/m-imagetext.jsp
[import, lang="html"](jsp-files/arguments.jsp)