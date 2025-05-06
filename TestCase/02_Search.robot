*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Search.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Suite Setup    Open Browwer And Login

*** Variables ***
${KEYWORD_WITH_SPACES}     ${SPACE*5}Cơm heo quay${SPACE*10}
${KEYWORD_FULLSPACES}    ${SPACE*5}
${Button_view_all_products}    //div//a//p[contains(text(), 'Xem tất cả sản phẩm')]
${CheckBox_banhmi}    (//div[@class='ProductPage_filter-item__-KdCI']//input[@type='checkbox'])[12]

*** Keywords ***


*** Test Cases ***
Product search successful enter correct product name
    Search success with text detail    Cơm heo quay

Product search successful enter approximate product name   #Nhập gần đúng
    Search success

Product search fails when product does not exist
    wait until element is visible    ${Input_Search}    ${TimeOut}
    input text    ${Input_Search}    Bánh Mỳ
    sleep    3s
    wait until element is visible    ${Message_error_search}    ${TimeOut}

Tìm kiếm sản phẩm không thành công khi nhập kí tự đặc biệt
    wait until element is visible    ${Input_Search}    ${TimeOut}
    input text    ${Input_Search}    !@#$%^&
    sleep    3s
    wait until element is visible    ${Message_error_search}    ${TimeOut}

Tìm kiếm sản phầm khi nhâp kí tự chứa khoảng trắng đầu cuối
    wait until element is visible    ${Input_Search}    ${TimeOut}
    input text    ${Input_Search}    ${KEYWORD_WITH_SPACES}
    ${status}    run keyword and return status    wait until element is visible    ${Message_error_search}    5s
    IF    "${status}" == "${true}"
        fail    Tìm kiếm không thành công khi nhập sản phẩm chứa khoảng trắng đầu cuối
    ELSE
        log to console  Tìm kiếm thành công, web tự động srim khi nhập sản phẩm chứa khoảng trắng đầu cuối
    END

Tìm kiếm sản phẩm bằng bộ lọc theo danh mục
    wait until element is visible    ${Button_view_all_products}    ${TimeOut}
    scroll element into view    ${Button_view_all_products}
    sleep    2s
    click element    ${Button_view_all_products}
    wait until element is visible    ${CheckBox_banhmi}    ${TimeOut}
    click element    ${CheckBox_banhmi}
    sleep    3s
    Shoule Be Equal Name Product    ${List_Name_Product_filter}


