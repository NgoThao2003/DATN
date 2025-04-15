*** Settings ***
Resource   Library.resource
Resource    Utils.resource
*** Variables ***
${BROWSER}   chrome
${URL}  https://hauifood.vn/auth/login
${Email_Locator}   //div//input[@type='email']
${Password_Locator}     //div//input[@type='password']
${Button_SignIn}    (//div//button)[1]

*** Keywords ***
Login Web Haui Food
    [Arguments]    ${Email}    ${Password}
#    Open Browser   ${URL}    ${BROWSER}
    maximize browser window
    Execute JavaScript    document.body.style.zoom = '0.8';
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}   ${Email}
    input text    ${Password_Locator}    ${Password}
    click button    ${Button_SignIn}

#Open Browwer And Login
#   Open Browser   ${URL}    ${BROWSER}    options=add_argument(--headless);add_argument(--no-sandbox);add_argument(--disable-dev-shm-usage)
##   Open Browser Headless Chrome
#   Login Web Haui Food    thaontt@gmail.com    Thao2702@

Open Browwer And Login
    ${random}=    Generate Random String    10
    ${user_data_dir}=    Set Variable    /tmp/user-data-${random}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --user-data-dir=${user_data_dir}
    Open Browser    ${URL}    chrome    options=${options}
    Login Web Haui Food    thaontt@gmail.com    Thao2702@