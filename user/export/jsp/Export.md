# Export {#Export}

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

### Configuration Sections

#### export.settings.jsp

Configurations that are used for all configured exports of this entity. This is overideable per specific export

#### export.jsp[]

Each configuration will export a artefact. For specific options see the section below.

#### export.jsp[].settings

This section is used to override configurations of macro calls in this specific export. See 


### Options

#### macro

* **Type:** `String`
* **export.settings.jsp:** No
* **export.jsp[]:** Yes
* **export.jsp[].settings:** No
* **Default:** The main macro of the entity (e.g. a_text)

Defines the macro that will be exported.


#### filename

* **Type:** `String`
* **export.settings.jsp:** No
* **export.jsp[]:** Yes
* **export.jsp[].settings:** No
* **Default:** `${includePath}/${categoryName}/${macroName}.jsp` or `${includePath}/${categoryName}/${entityId}.jsp`

Define the filename of the exported macro. The .jsp extensions is added automatically. When no path is specified the default path (the categroy plural name in lowercase) is prepended.


#### mode

* **Type:** `Enum[include|inline]`
* **export.settings.jsp:** Yes
* **export.jsp[]:** No
* **export.jsp[].settings:** Yes
* **Default:** `include`

Defines if the macro will be included via jsp:include or inlined at the calling site.


#### parameters

* **Type:** `Array`
* **export.settings.jsp:** Yes
* **export.jsp[]:** Yes
* **export.jsp[].settings:** No
* **Default:** `[]`

Allows to specify parameter default values for macros. This only applies to exporting full macros. If you want to change the arguments of a macro call please see #arguments


#### arguments

* **Type:** `Array`
* **export.settings.jsp:** No
* **export.jsp[]:** No
* **export.jsp[].settings:** Yes
* **Default:** `[]`

Allows to specify arguments that will be used when calling macros.
