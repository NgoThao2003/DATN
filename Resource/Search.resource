*** Settings ***
Resource   Library.resource
Resource    Utils.resource


*** Variables ***
${Input_Search}    //div[@class='Banner_banner__search-container__V9pTi']//input
${Button_Search}    //button[contains(text(), 'Tìm kiếm')]
${List_Name_Product}    //div[@class='col-xl-4 col-12']//div[2]//div[@class='ProductCard_product__name__6llVj']
${Message_error_search}    //div[@class='NoResult_no-result__content__y3KQf']//h3
${Icon_search}    //*[name()='svg' and @class='Banner_search-icon__k9VXG']

*** Keywords ***
Shoule Be Equal Name Product
    ${elements}   Get Webelements    ${List_Name_Product}
    ${len}    Get Length    ${elements}
    FOR   ${index}   IN RANGE    1   ${len}+1
        ${Product}    get text    (${List_Name_Product})[${index}]
        scroll element into view    (${List_Name_Product})[${index}]
        ${status}    run keyword and return status    Should Contain    ${Product.lower()}    bánh mì
        IF    "${status}" == "${true}"
            log to console   Product ${index} search success

        ELSE
            log to console  Product ${index} is different from search Product
        END
    END

Search success
    wait until element is visible    ${Input_Search}    ${TimeOut}
    sleep    3s
    input text    ${Input_Search}    Bánh Mì
    click element    ${Button_Search}
    sleep    3s
    Shoule Be Equal Name Product

Search success with text detail
    wait until element is visible    ${Input_Search}    ${TimeOut}
    sleep    3s
    input text    ${Input_Search}    Bánh Mì Siêu Nhân
    click element    ${Button_Search}
    sleep    3s
    Shoule Be Equal Name Product

