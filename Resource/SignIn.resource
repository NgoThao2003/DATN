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
#   Open Browser   ${URL}    ${BROWSER}    options=--headless,--no-sandbox,--disable-dev-shm-usage
#   Login Web Haui Food    thaontt@gmail.com    Thao2702@


#Open Browwer And Login
#  ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
##   Call Method    ${options}    add_argument    --headless      <-- Bỏ dòng này
#    Call Method    ${options}    add_argument    --no-sandbox
#    Call Method    ${options}    add_argument    --disable-dev-shm-usage
#    ${arg}=    Evaluate    "--user-data-dir=D:/Downloads/Đồ Án Tốt Nghiệp_Thảo/HAUI_Food/TestCase"
#    Call Method    ${options}    add_argument    ${arg}
#    Open Browser   ${URL}    ${BROWSER}    options=${options}
#    Login Web Haui Food    thaontt@gmail.com    Thao2702@

Open Browwer And Login
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${is_ci}=    Get Environment Variable    CI    False
    Run Keyword If    '${is_ci}'=='true'    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    # Nếu cần dùng profile có sẵn:
#     ${arg}=    Evaluate    "--user-data-dir=D:/Downloads/Đồ Án Tốt Nghiệp_Thảo/HAUI_Food/TestCase"
#     Call Method    ${options}    add_argument    ${arg}
    Open Browser   ${URL}    ${BROWSER}    options=${options}
    Login Web Haui Food    thaontt@gmail.com    Thao2702@