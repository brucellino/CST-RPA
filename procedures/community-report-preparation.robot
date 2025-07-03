*** Comments ***

This is a set of tasks for performing procedures related to community support team
procedures

*** Settings ***
Task Setup    Setup

Library    Browser 
Library    libraries/keywords.py

*** Variables ***

${CST_MEETINGS_PAGE}    https://confluence.egi.eu/display/Support/
${REPORT_TEMPLATE_ID}    42827796
${SPACE_KEY}    Support

*** Tasks ***

Make A New Weekly Report Page
    Log Into Confluence
    Make A Page From Template
    Sleep    10s


*** Keywords ***
Setup
    Should Not Be Empty    %{CONFLUENCE_USERNAME}
    Should Not Be Empty    %{CONFLUENCE_PASSWORD}
    New Browser    firefox    headless=False
    New Page    https://confluence.egi.eu
    

Log Into Confluence
    Click    //*[@id="login-link"]
    # Fill Text    selector=//*[@id="username"]    txt=%{CONFLUENCE_USERNAME}
    Fill Text    selector=//*[@id="username"]    txt=brucelli
    Fill Text    selector=//*[@id="password"]    txt=%{CONFLUENCE_PASSWORD}
    Click    //button[text()="Login"]
    # Deal with "AI" protection (lol)
    Run Keyword and Ignore Error    Wait For Navigation    url=https://confluence.egi.eu
    ${url}=    Get Url
    Log To Console    message=${url}
    IF    "${url}" != "https://confluence.egi.eu/"
        Sleep    30s
    END

Make A Page From Template
    ${thursday}=    This Thursday
    Log To Console    ${thursday}
    ${year}=    Get Time    format=year
    Go To    ${CST_MEETINGS_PAGE}/${year}+reports
    Click    //a[@data-macro-name="create-from-template"]
    # Sleep    30s
    Wait For Elements State    selector=//*[@id="content-title"]    state=visible
    Type Text    selector=//input[@id="content-title"]    txt=${thursday}
    Click    //button[@id="rte-button-publish"]