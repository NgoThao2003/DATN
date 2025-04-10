*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Resource    ../Resource/Search.resource
Suite Setup    Open Browwer And Login

*** Variables ***
${Name_product_detail}   //div[@class='QuantityDrawer_quantity-drawer__product-container__eQUNL']//div//div[1]
${Name_Product}    (//div[@class='ProductCard_product__name__6llVj'])[1]
${Price}    (//div[@class='ProductCard_product__price__gn9Y9'])[1]
*** Keywords ***

*** Test Cases ***
View dish details successfully when user is logged in
    Search success
    ${Name_product}    get text     ${Name_Product}
    ${Price}    get text    ${Price}
    click element    (${List_Name_Product})[1]
    sleep    2s
    wait until element is visible    ${Name_product_detail}
    ${Name_product_detail}    get text    ${Name_product_detail}
    ${status}    run keyword and return status    should be equal    ${Name_product}    ${Name_product_detail}
    IF    '${status}' == '${False}'
        fail    Test case view product detail fail
    ELSE
        log to console    Success
    END
#Luồng này để sau