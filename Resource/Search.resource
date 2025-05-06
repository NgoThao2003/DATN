*** Settings ***
Resource   Library.resource
Resource    Utils.resource


*** Variables ***
${Input_Search}   //div[@class='Banner_banner__search-container__FojyL']//input
${Button_Search}    //button[contains(text(), 'Tìm kiếm')]
${List_Name_Product}     //div[@class='col-xl-4 col-12']//div[2]//div[@class='ProductCard_product__name__+2tDs']
${List_Name_Product_filter}    //div[@class='RestaurantCard_restaurant-card__name__bQVXy']
${Message_error_search}     //div[@class='NoResult_no-result__ixgb-']//h3

*** Keywords ***
Shoule Be Equal Name Product
    [Arguments]    ${List}
    ${elements}   Get Webelements    ${List}
    ${len}    Get Length    ${elements}
    FOR   ${index}   IN RANGE    1   ${len}+1
        ${Product}    get text    (${List})[${index}]
        scroll element into view    (${List})[${index}]
        ${status}    run keyword and return status    Should Contain    ${Product.lower()}    bánh mì
        IF    "${status}" == "${true}"
            log to console   Product ${index} search success

        ELSE
            log to console  Product ${index} is different from search Product
        END
    END

Search success
    wait until element is visible    ${Input_Search}    ${TimeOut}
    input text    ${Input_Search}    Bánh Mì
    sleep    3s
    Shoule Be Equal Name Product    ${List_Name_Product}

Search success with text detail
    [Arguments]    ${Text}
    wait until element is visible    ${Input_Search}    ${TimeOut}
    input text    ${Input_Search}    ${Text}
    sleep    3s
    Shoule Be Equal Name Product    ${List_Name_Product}

