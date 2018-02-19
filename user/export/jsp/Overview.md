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

