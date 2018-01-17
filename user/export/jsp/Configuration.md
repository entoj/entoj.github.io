# Configuration {#Configuration}

## Global

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
            imageBaseUrl: '',
            viewHelperUri: 'http://foo.com/bar',
            viewHelperNamespace: 'bar'
        }
    });
```


## Build environments

```javascript
// Full featured Example
configuration.build.environments.add(
    {
        staging =
        {
	        jsp:
	        {
                exportPath: '${cache}/export',
                entityPathTemplate: '',
                entityFilenameTemplate: '',
                entityMacroFilenameTemplate: '',
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


## Options

### jsp.exportPath

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `${cache}/${configurationName}/export`

The base path used to store exported artefacts. Standard directories may be used as variables.


### jsp.jspBasePath

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `includes`

The base path used to store exported jsp artefacts. This is relative to [jsp.exportPath](#jsp.exportPath).


### jsp.jspIncludePath

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `/includes`

The base url used to include jsp artefacts.


### jsp.imageBaseUrl

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base url for rendering |imageUrl filters


### jsp.assetBaseUrl

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base url for rendering |assetUrl filters


### jsp.svgBaseUrl

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base url for rendering |svgUrl filters


### jsp.svgBasePath

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base path for reading svg icons needed to render |svgViewBox filters


### jsp.viewHelperUri

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `https://entoj.io/entoj`

Used as the uri for the main view helper registration


### jsp.viewHelperNamespace

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `entoj`

Used as the namespace for the main view helper registration
