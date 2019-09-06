# Bash
Resource for general Linux commands and Bash Shell scripting

# Contents
[Command Line](#command-line)<br>
[Scripting](#scripting)<br>

<a id="command-line"></a>
## Command Line Tricks

### Contents

[Empty Trash Can](#command-line_empty-trash-can)<br>

<br><br>

<a id="command-line_empty-trash-can"></a>
### Empty Trash Can Fast

```Bash
cd .local/share/Trash/
cd files
rm -rf *
```


## Scripting

### Contents

[OpenMRS github downloads and maven installs](#scripting_openmrs-github-maven)<br>

<br><br>

<a id="scripting_openmrs-github-maven"></a>
### OpenMRS github downloads and maven installs

See **script-OpenMRS_RefApp-2.8.0.sh**

Script to download and compile OpenMRS Reference Application 2.8.0. Clones the github, checkouts the release version being used, compiles the modules via maven/npm, and moves the files into the proper tomcat folders for web application launch.



