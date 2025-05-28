*** Settings ***
Resource   Library.resource
Resource    Utils.resource
*** Variables ***
${BROWSER}   chrome
${URL}  https://hauifood.vn/auth/login
${Email_Locator}   //div//input[@type='email']
${Password_Locator}     //div//input[@type='password']
${Button_SignIn}   //div//button[@type="submit"]
${CHROME_ARGS}    --no-sandbox --disable-dev-shm-usage --user-data-dir=D:/Downloads/DATNThao/HAUI_Food/TestCase
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

Open Browwer And Login
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${is_ci}=      Get Environment Variable    CI    False

    # Khai báo list chứa các argument mặc định
    ${chrome_args}=    Create List    --no-sandbox    --disable-dev-shm-usage

    # Thêm headless nếu chạy CI
    Run Keyword If    '${is_ci}'=='true'    Append To List    ${chrome_args}    --headless

    # Thêm user profile nếu chạy local
    Run Keyword Unless    '${is_ci}'=='true'    Append To List    ${chrome_args}    --user-data-dir=D:/Downloads/DATNThao/HAUI_Food/TestCase

    # Thêm tất cả argument vào ChromeOptions
    FOR    ${arg}    IN    @{chrome_args}
        Call Method    ${options}    add_argument    ${arg}
    END

    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Login Web Haui Food    thaontt@gmail.com    Thao2702@