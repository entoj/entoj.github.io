# JSP exporter

A jsp artefact exporter. All configured entities will export their templates as single jsp files. Macro calls are resolved at runtime via jsp:includes.

## Feature Support

### Yield macros

Macros calls with custom body content like
```jinja
{% call macro() %}
    <p>STUFF</p>
{% endcall %}
```
are supported by automatically inlining the called macro.


### Filters

The table below shows what core nunjucks filters are supported. For details about each filter see ...

Filter | Supported | Comment
-------|-----------|--------
AssetUrlFilter | Yes | see [jsp.assetBaseUrl](#jsp.assetBaseUrl)
AttributesFilter | Yes |
DebugFilter | Yes |
EmptyFilter | Yes |
FormatDateFilter | Yes | uses fmt:formatDate to format the date; the default format is configured via configuration.settings.formats.date
FormatNumberFilter | No | 
GetFilter | Yes |
HyphenateFilter | No |
LinkUrlFilter | Yes | uses c:url to generate the link.
LipsumFilter | No |
LoadFilter | Yes |
MarkdownFilter | No |
MarkupFilter | Yes | the content is just passed through
MediaQueryFilter | Yes | the exporter will create a helper includes/helper/mediaQueries.jsp that contains a map of all known media query to name mapings
ModuleClassesFilter | Yes |
NotEmptyFilter | Yes |
SetFilter | Yes |
SettingFilter | No |
SvgUrlFilter | Yes | see [jsp.svgBaseUrl](#jsp.svgBaseUrl)
SvgViewBoxFilter | Yes | the exporter will create a helper includes/helper/svgViewBoxes.jsp that contains a map of all known svg files with their viewboxes; see [jsp.svgBasePath](#jsp.svgBasePath)
TranslateFilter | Yes | uses fmt:message to translate strings
UniqueFilter | Yes |

