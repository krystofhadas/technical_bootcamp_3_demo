*** Settings ***
Library                                     Browser
Library                                     Builtin

*** Variables ***
${URL}=                                     http://tutorialsninja.com/demo/
${KOSIK}=                                   //span[@id="cart-total"]

*** Keywords ***
Jdi na homepage
    New page                                ${URL}
    get title                               equal  Your Store

Zmen měnu
    [Documentation]     Zmeni menu stranky z puvodni na novou, defaultne je puvodni mena dolar
    [Arguments]         ${nova_mena}
    ${aktualni_mena_v_kosiku}  get text     ${KOSIK}
    skip if                                 "${nova_mena}" in """${aktualni_mena_v_kosiku}"""
    ...  msg=NOT TESTED! Puvodni mena v kosiku je stejna jako planovana, nova mena: ${nova_mena}. Aktualni mena je: ${aktualni_mena_v_kosiku}
    #dropdown s menama ($, €, £)
    click                                   //button[@class="btn btn-link dropdown-toggle"]
    click                                   //button[contains(text(),"${nova_mena}")]
    #assertion - nove nastavena mena je aktualni menou kosiku
    ${aktualni_mena_v_kosiku}  get text     ${KOSIK}
    should contain                          ${aktualni_mena_v_kosiku}  ${nova_mena}
    ...  msg=Nove nastavena mena kosiku neni v ${nova_mena}, ale mela by byt. Aktualni mena je: ${aktualni_mena_v_kosiku}