*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
At start the counter is zero
    Go To  ${HOME_URL}
    Title Should Be  Laskuri
    Page Should Contain  nappia painettu 0 kertaa

When button pressed twice the counter is two
    Go To  ${HOME_URL}
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa

When set value
    Go To  ${HOME_URL}
    Click Element  value
    Input Text  value  -10
    Click Button  aseta
    Page Should Contain  nappia painettu -10 kertaa

When set value blank
    Go To  ${HOME_URL}
    Click Button  aseta
    Page Should Contain  nappia painettu 0 kertaa

When set value not number
    Go To  ${HOME_URL}
    Click Element  value
    Input Text  value  -10
    Click Button  aseta
    Click Element  value
    Input Text  value  a
    Click Button  aseta
    Page Should Contain  nappia painettu -10 kertaa

When Nollaa button pressed counter is zero
    Go To  ${HOME_URL}
    Click Button  Paina
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa