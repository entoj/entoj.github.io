## Examples {#Examples}

### Templates
All examples below are based on the following template files:

#### base/atoms/a-text/a-text.j2
[import, lang="jinja"](jsp-files/a-text.j2)


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


### Changing default values of parameters or renaming them

#### Configs
##### base/atoms/a-text/parameters.json
[import](jsp-files/parameters.json)

#### Exported
##### includes/atoms/a-text.jsp
[import, lang="html"](jsp-files/parameters.jsp)


### Inlining macros {#ExampleInline}

#### Configs
##### base/atoms/a-text/inline.json
[import](jsp-files/inline.json)

#### Exported
##### includes/modules/include.jsp
[import, lang="html"](jsp-files/include.jsp)

##### includes/modules/inline.jsp
[import, lang="html"](jsp-files/inline.jsp)


### Changing argument values of called macros

#### Configs
##### base/atoms/a-text/arguments.json
[import](jsp-files/arguments.json)

#### Exported
##### includes/atoms/a-text.jsp
[import, lang="html"](jsp-files/arguments.jsp)