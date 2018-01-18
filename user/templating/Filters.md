# Filters

Filter are used to encapsulate common functionalities and make them transferable to target plattforms via template exports. 

The configuration of the filters is done in `entoj-configuration.js`.


## Urls {#Urls}

### AssetUrlFilter {#AssetUrlFilter}

* **Name:** `assetUrl`
* **Parameters:** None
* **Returns:** `String`
* **Configuration:**
    * `baseUrl: String`  
      The base url to build the assets url. Defaults to `/`.

Generates a url for the given asset name.

**Example:**
```django
    {{ 'someasset.gif'|assetUrl }}
    {# => base/url/someasset.gif #}
```

### LinkUrlFilter {#LinkUrlFilter}

* **Name:** `linkUrl` or `link`
* **Parameters:** None
* **Returns:** `String`
* **Configuration:**
    * `dataProperties: Array`  
      A list of properties that will be used as the url when the filter was used on a object. Defaults to `['url']`

Generates a url for the given link. If this fails `JavaScript:;` is returned as a default.

**Example:**
```django
    {{ '/hi/there'|linkUrl }}
    {# => /hi/there #}

    {{ { url: '/hi/there' }|linkUrl }}
    {# => /hi/there #}
```

## SVG {#SVG}

### SvgUrlFilter {#SvgUrlFilter}

* **Name:** `svgUrl`
* **Parameters:** None
* **Returns:** `String`
* **Configuration:**
    * `baseUrl: String`  
      The base url to build the svg url. Defaults to `/`.

Generates a url for the given svg name. This filter assumes that the svg contains a symbol name icon and is used via `<use xlink:href="..."></use>`.

**Example:**
```django
    {{ 'close'|svgUrl }}
    {# => /close.svg#icon #}
```


### SvgViewBoxFilter {#SvgViewBoxFilter}

* **Name:** `svgViewBox`
* **Parameters:** None
* **Returns:** `String`
* **Configuration:**
    * `basePath: String`  
      The base path relative to `${sites}` to build the svg file path. Defaults to `/`.

Reads the viewBox of the given svg name. When the svg contains no viewBox `0 0 0 0` is returned as the default.

**Example:**
```django
    {{ 'close'|svgViewBox }}
    {# => 0 0 25 25 #}
```

## Variables

### EmptyFilter {#EmptyFilter}

* **Name:** `empty`
* **Parameters:** None
* **Returns:** `Boolean`
* **Configuration:** None

Returns true if a variable is:
* `null`
* `''`
* a empty `Array`
* a empty `Map`
* `{}`
* `undefined`

**Example:**
```django
    {{ variable|empty }}
    {# => true #}

    {% set variable = 'hi' %}
    {{ variable|empty }}
    {# => false #}
```


### NotEmptyFilter

* **Name:** `notEmpty`
* **Parameters:** None
* **Returns:** `Boolean`
* **Configuration:** None

Returns true if a variable is not empty (see [EmptyFilter](#EmptyFilter)). 

**Example:**
```django
    {{ variable|notEmpty }}
    {# => false #}

    {% set variable = 'hi' %}
    {{ variable|notEmpty }}
    {# => true #}
```


### GetFilter

* **Name:** `get` or `getProperty`
* **Parameters:** 
    * `key: String`  
      The key of the desired value.
* **Returns:** `Mixed`
* **Configuration:** None

Returns the value of a object at `key`. If key does not exist `undefined` is returned.

**Example:**
```django
    {{ variable|get('property') }}
    {# => undefined #}

    {% set variable = { property: 'hi' } %}
    {{ variable|get('property') }}
    {# => hi #}
```


### SetFilter

* **Name:** `set` or `setProperty`
* **Parameters:** 
    * `key: String`  
      The key.
    * `value: Mixed`  
      The value.      
* **Returns:** `Object`
* **Configuration:** None

Sets the `key` of the given object to `value`. If no object was given a new one will be created and returned.

**Example:**
```django
    {{ variable|set('property', 'value') }}
    {# => { property: 'value' } #}
    {{ variable|set('property', 'hi') }}
    {# => { property: 'hi' } #}
```


## Formatting

### AttributesFilter

* **Name:** `customAttributes` or `attributes`
* **Parameters:** 
    * `prefix: String`  
      All properties names will be prefixed with this
* **Returns:** `String`
* **Configuration:** None

Iterates over the given object and returns a attribute string. Camel case on keys will be converted to kebab case.

**Example:**
```django
    {{ { 'foo': 'bar', 'fooBar': 'foo' }|attributes }}
    {# => foo="bar" foo-bar="foo" #}

    {{ { 'foo': 'bar', 'fooBar': 'foo' }|attributes('data') }}
    {# => data-foo="bar" data-foo-bar="foo" #}    
```


### FormatDateFilter

* **Name:** `formatDate` or `date`
* **Parameters:** 
    * `format: String`  
      A (date format string)[http://momentjs.com/docs/#/displaying/]
* **Returns:** `String`
* **Configuration:** None

Formats the given date as a string. If format is not specified the global date format will be used.

**Example:**
```django
    {{ '12.01.2018'|formatDate }}
    {# => 12.01.2018 #}

    {{ '12.01.2018'|formatDate('YYYY-MM-DD') }}
    {# => 2018-01-12  #}    
```


### FormatNumberFilter

* **Name:** `formatNumber` or `number`
* **Parameters:** 
    * `format: String`  
      A (number format string)[http://numeraljs.com/#format]
* **Returns:** `String`
* **Configuration:** None

Formats the given number as a string. If format is not specified the global number format will be used.

**Example:**
```django
    {{ 1000|formatNumber }}
    {# => 1000,00 #}

    {{ 1000|formatNumber('0,0.0000') }}
    {# => 1.000,0000  #}    
```


### HyphenateFilter

* **Name:** `hyphenate`
* **Parameters:** None
* **Returns:** `String`
* **Configuration:** None

Inserts soft hyphens into the given text. Useful for headlines and short texts.

**Example:**
```django
    {{ 'hyphenation'|hyphenate }}
    {# => hy|phen|ation #}
```


### MarkdownFilter

* **Name:** `markdown`
* **Parameters:** None
* **Returns:** `String`
* **Configuration:** None

Transforms the given markdown into html.

**Example:**
```django
    {{ '# Hi'|markdown }}
    {# => <h1>Hi</h1> #}
```


### MarkupFilter

* **Name:** `markup`
* **Parameters:** 
    * `type: [plain|html]`  
      Defines the expected output
* **Returns:** `String`
* **Configuration:**
    * `styles: Object`  
      Defines a map of custom names to known types (plain or html)

Transforms the given text into html or plaintext. This filter is used as a abstraction of rte fields known from cms systems.

**Example:**
```django
    {{ '<p>Hi</p>'|markup }}
    {# => <p>Hi</p> #}

    {{ '<p>Hi</p>'|markup('plain') }}
    {# => Hi #}

    {{ 'Hi, how is it?'|markup('html') }}
    {# => Hi, <b>how</b> is it? #}    
```


## Data

### LoadFilter

* **Name:** `load`
* **Parameters:** None
* **Returns:** `Object`
* **Configuration:** None

Loads json files located in the models directory of a entity and processes any macros it finds. To learn more about those macros please see the ViewModel documentation. 

The filter will only load models when given a string that points to valid json file.
You should use the shortform of entity/json (e.g. e-cta/default).

**Example:**
```django
    {% set model = model|load %}
    {% set model = 'e-cta/primary'|load %}
```


### SettingFilter

* **Name:** `setting`
* **Parameters:** None
* **Returns:** `Object`
* **Configuration:** None

Abstracts the idea of global settings that are accessible via a unique string key. To learn more about how to add settings please see the SettingsModel documentation.

**Example:**
```django
    {% set setting = 'de.entoj.name'|setting %}
```


### TranslateFilter

* **Name:** `translate`
* **Parameters:** 
    * `...variables: Mixed`  
      Provides variables for placeholders. The first variable is named {0}
* **Returns:** `String`
* **Configuration:** None

Provides a simple translation facility that works based on unique identifiers for translations. It supports a simple form of placeholders in the translated strings. To learn more about how to add translations please see the TranslationModel documentation.

**Example:**
```django
    {{ 'de.entoj.name'|translate }}
    {# => Entoj #} 

    {{ 'de.entoj.greeting'|translate('Darth') }}
    {# => Hi, {0}! => Hi, Darth! #}
```


### MediaQueryFilter

* **Name:** `mediaQuery`
* **Parameters:** None
* **Returns:** `String`
* **Configuration:** None

Returns one of the defined media queries and their derivations. The breakpoints are defined via GlobalSettings. It supports the suffixes `andBelow` and `andAbove`.

**Example:**
```django
    {{ 'tablet'|mediaQuery }}
    {# => (min-width: 1024px) and (max-width: 1024px) #} 

    {{ 'tabletAndBelow'|mediaQuery }}
    {# => (max-width: 1024px) #} 

    {{ 'tabletAndAbove'|mediaQuery }}
    {# => (min-width: 1024px) #}     
```


## Helper

### DebugFilter

* **Name:** `debug`
* **Parameters:** None
* **Returns:** `void`
* **Configuration:** None

Outputs a json dump and the type of the given variable.

**Example:**
```django
    {{ 'de.entoj.name'|debug }}
    {# => <pre>string :: "de.entoj.name"</pre> #}
```


### LipsumFilter

* **Name:** `lipsum`
* **Parameters:** None
* **Returns:** `void`
* **Configuration:** None

Outputs a json dump and the type of the given variable.

**Example:**
```django
    {{ 'de.entoj.name'|debug }}
    {# => <pre>string :: "de.entoj.name"</pre> #}
```


### UniqueFilter

* **Name:** `unique`
* **Parameters:** 
    * `seperator: String`  
      Provides a custom placeholder between the id and the prefix. Defaults to `-`
* **Returns:** `String`
* **Configuration:** None

Outputs a request unique id. It uses the given value as a prefix. The default seperator is a dash.

**Example:**
```django
    {{ 'pre'|unique }}
    {# => pre-1 #}

    {{ 'pre'|unique('#') }}
    {# => pre#2 #}    
```


### ModuleClassesFilter

* **Name:** `moduleClasses`
* **Parameters:** 
    * `moduleClass: String`  
      The base module class
* **Returns:** `String`
* **Configuration:** None

Generates BEM compatible class modifiers. If no moduleClass is given a empty string is returned.

**Example:**
```django
    {{ false|moduleClasses('a-cta') }}
    {# => a-cta #}

    {{ 'primary'|moduleClasses }}
    {# => #}

    {{ 'primary'|moduleClasses('a-cta') }}
    {# => a-cta a-cta--primary #}    

    {{ ['primary', 'active']|moduleClasses('a-cta') }}
    {# => a-cta a-cta--primary a-cta--active #}        
```


