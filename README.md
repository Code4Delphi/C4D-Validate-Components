# C4D Validate Components
<p align="center">
  <a href="https://github.com/Code4Delphi/Code4D-Wizard/blob/master/Images/C4D-Logo.png">
    <img alt="Code4Delphi" height="100" src="https://github.com/Code4Delphi/Code4D-Wizard/blob/master/Images/c4d-logo-100x100.png">
  </a> 
</p>
Utility for automatic validation of Delphi forms. Excellent to be used for both new projects and legacy products. Facilitating form field validations and reducing code complexity. It can be used for both DBWare and non-DBWare components.



## 📞 Contacts

<p align="left">
  <a href="https://t.me/Code4Delphi" target="_blank">
    <img src="https://img.shields.io/badge/Telegram:-Join%20Channel-blue?logo=telegram">
  </a>   
  &nbsp;
  <a href="https://www.youtube.com/@code4delphi" target="_blank">
    <img src="https://img.shields.io/badge/YouTube:-Join%20Channel-red?logo=youtube&logoColor=red">
  </a> 
  &nbsp;
  <a href="https://www.linkedin.com/in/cesar-cardoso-dev" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn:-Follow-blue?logo=LinkedIn&logoColor=blue">
  </a> 
  &nbsp;
  <a href="mailto:contato@code4delphi.com.br" target="_blank">
    <img src="https://img.shields.io/badge/E--mail-contato%40code4delphi.com.br-yellowgreen?logo=maildotru&logoColor=yellowgreen">
  </a>
</p>



## ⚙️ Installation

* Installation using the [**Boss**](https://github.com/HashLoad/boss):

```
boss install github.com/Code4Delphi/C4D-Validate-Components
```

* **Manual installation**: Open your Delphi and add the following folder to your project, under *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*

```
..\C4D-Validate-Components\Src
```



## 🚀 Quickstart
* Add uses to your system:
```
uses
  C4D.Validate.Components;
```

* Insert the Custom Attributes on the component declaration you want to validate:
```
[FieldDisplay('Name')]
[NotEmpty]
[Length(5, 15)]
edtName: TEdit;
```

* Make the call for form validation:
```
TC4DValidateComponents.Validate(TClasseDoForm, Self);
```

## Custom Attributes available:

* Name to be displayed if there are errors:
```
[FieldDisplay('Name to be displayed')]
```

* Validates so that the field is not empty:
```
[NotEmpty]
```

* Enter a minimum and/or maximum number of characters for the field:
```
[Length(5, 15)]
```

* Enter the minimum and/or maximum value that must be entered in the field:
```
[MinMaxValue(5, 10)]
```

* Enter the minimum and/or maximum date that must be entered in the field
```
[MinMaxDate('01/12/2023', '10/12/2023')]
```

## ⌨️ Demo
* Next to the project sources, you will find a test project, in the folder:
```
C4D-Validate-Components\Samples\Demo01
```

<br/>
<br/>

> [!TIP]
> Starting with Delphi version 10.3, if you use a custom attribute that is not known to the compiler (because you typed it incorrectly or a unit is missing in the uses statement), you will receive a Warning:
> ```
> Warning: W1074 Unknown custom attribute
> ```
> It is recommended to transform this Warning into an error, so that correction is mandatory, to do so enter:
> ```
> {$WARN UNKNOWN_CUSTOM_ATTRIBUTE ERROR}
> ```

‌
# 💬 Contributions / Ideas / Bug Fixes
To submit a pull request, follow these steps:

1. Fork the project
2. Create a new branch (`git checkout -b minha-nova-funcionalidade`)
3. Make your changes
4. Make the commit (`git commit -am 'Functionality or adjustment message'`)
5. Push the branch (`git push origin Message about functionality or adjustment`)
6. Open a pull request
