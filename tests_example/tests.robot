*** Settings ***
Resource                                    ../resources_example/homepage.robot

Documentation                               Test je mozne spustit pomoci commandu: "robot -d results ." (bez uvozovek), vysledky budou v results slozce.

*** Test Cases ***
Pri zmene meny se zmeni mena v kosiku
    [Documentation]     Zmena meny ("currency") v dropdownu se promeni zmenou meny ("currency") v kosiku
    [Setup]             Jdi na homepage

    Zmen měnu                               €




