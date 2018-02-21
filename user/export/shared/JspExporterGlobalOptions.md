
#### Options {#ModuleOptions}

##### {{ configName }}.exportPath {#{{ configName }}.exportPath}

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `${cache}/export`

The base path used to store all exported artefacts. Standard directories may be used as variables.


##### {{ configName }}.jspBasePath

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `includes`

The base path used to store exported jsp artefacts. This is relative to [jsp.exportPath](#jsp.exportPath).


##### {{ configName }}.jspIncludePath

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `/includes`

The base url used to include jsp artefacts via jsp:include.


##### {{ configName }}.imageBaseUrl {#{{ configName }}.imageBaseUrl}

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base url for rendering |imageUrl filters.


##### {{ configName }}.assetBaseUrl {#{{ configName }}.assetBaseUrl}

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base url for rendering |assetUrl filters.


##### {{ configName }}.svgBaseUrl {#{{ configName }}.svgBaseUrl}

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base url for rendering |svgUrl filters.


##### {{ configName }}.svgBasePath {#{{ configName }}.svgBasePath}

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** ``

Used as the base path for reading svg icons needed to render |svgViewBox filters.


##### {{ configName }}.viewHelperUri {#{{ configName }}.viewHelperUri}

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `https://entoj.io/entoj`

Used as the uri for the main view helper registration.


##### {{ configName }}.viewHelperNamespace {#{{ configName }}.viewHelperNamespace}

* **Type:** `String`
* **Global:** Yes
* **Environment:** Yes
* **Default:** `entoj`

Used as the namespace for the main view helper registration.

