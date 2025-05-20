*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Resource    ../Resource/Search.resource
Resource    ../Resource/ShoppingCardManagement.resource
Suite Setup    Open Browwer And Login

*** Variables ***
${Button_Pay}    //div//button//p[contains(text(), 'Thanh toán')]
${Button_Pay_Disable}    //button[@class='Button_wrapper__6uHX0 Button_primary__CHwmz Button_disabled__UuTSG Button_order__Jbyhw']
${Final_Text_Step_Pays}   //div//h1[contains(text(), 'Bước cuối cùng - Thanh toán')]
${Button_Order}     //div//button//p[contains(text(), 'Đặt đơn')]
${Button_Đơn_Hang}    (//button//p[contains(text(),'Đơn hàng')])[2]
${Input_sđt}     //div//input[@id='phone-number']
${Input_address}     //div//input[@id='address-input']
${Note}    //div//input[@placeholder='Hãy gọi điện trước cho tôi']
${Message_order_create_success}   //div//div[contains(text(), 'Đặt hàng thành công')]
${Message_error_sđt}     //div//span[contains(text(), 'Số điện thoại không được để trống')]
${Message_error_address}     //div//span[contains(text(), 'Địa chỉ không được để trống')]
${Icon_loading}    //div[@class='modal-loading__content']
${Pay_By_E_Wallet}     //div//label//span[contains(text(), 'Thanh toán bằng Ví Điện Tử HaUI Food')]
${Logo}     //a//img[@class='Header_header__logo__QkqZR']

*** Keywords ***
Buy Product
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    wait until element is visible    ${Card_product_detail}    5s
    wait until element is visible    ${Button_Pay}
    click element    ${Button_Pay}
    wait until element is not visible    ${Icon_loading}    ${TimeOut}
    wait until element is visible    ${Final_Text_Step_Pays}    ${TimeOut}
    wait until element is visible    ${Input_sđt}
    input text    ${Input_sđt}    0955437243
    input text    ${Input_address}    25 ngõ 249 Mai Dịch, Cầu Giấy
    scroll element into view    ${Note}
    input text    ${Note}    Giao tận cửa

Message Pay successful And Go To Home Page
    wait until element is visible    ${Message_order_create_success}    ${TimeOut}
    wait until element is visible    ${Button_Đơn_Hang}    ${TimeOut}
    wait until element is not visible    ${Icon_loading}     ${TimeOut}
    click element    ${Logo}
    sleep    1s

*** Test Cases ***
#Mua hàng thành công, thanh toán khi nhận hàng
Purchase successful with cash on delivery
    Product add card
    Buy Product
    scroll element into view    ${Button_Order}
    click element    ${Button_Order}
    Message Pay successful And Go To Home Page

Purchase successful when paying with HauiFood e-wallet
    Product add card
    Buy Product
    scroll element into view    ${Pay_By_E_Wallet}
    click element    ${Pay_By_E_Wallet}
    scroll element into view    ${Button_Order}
    click element    ${Button_Order}
    Message Pay successful And Go To Home Page

#Không nhập ghi chú
Purchase successful without entering notes
    Product add card
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    wait until element is visible    ${Card_product_detail}    5s
    wait until element is visible    ${Button_Pay}
    click element    ${Button_Pay}
    wait until element is not visible    ${Icon_loading}    ${TimeOut}
    wait until element is visible    ${Final_Text_Step_Pays}    ${TimeOut}
    wait until element is visible    ${Input_sđt}    ${TimeOut}
    sleep    1s
    input text    ${Input_sđt}    0955437243
    input text    ${Input_address}    25 ngõ 249 Mai Dịch, Cầu Giấy
    scroll element into view    ${Button_Order}
    click element    ${Button_Order}
    Message Pay successful And Go To Home Page


Purchase failed when phone number not entered
    Product add card
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    wait until element is visible    ${Card_product_detail}    5s
    wait until element is visible    ${Button_Pay}
    click element    ${Button_Pay}
    wait until element is not visible    ${Icon_loading}    ${TimeOut}
    wait until element is visible    ${Final_Text_Step_Pays}    ${TimeOut}
    wait until element is visible    ${Input_address}
    input text    ${Input_address}    25 ngõ 249 Mai Dịch, Cầu Giấy
    scroll element into view    ${Note}
    input text    ${Note}    Giao tận cửa
    clear text    ${Input_sđt}
    wait until element is visible    ${Message_error_sđt}
    wait until element is visible    ${Button_Pay_Disable}    ${TimeOut}
    scroll element into view    ${Button_Pay_Disable}
    click element    ${Logo}
    sleep    2s

Purchase failed when address not entered
    Product add card
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    wait until element is visible    ${Card_product_detail}    5s
    wait until element is visible    ${Button_Pay}
    click element    ${Button_Pay}
    wait until element is not visible    ${Icon_loading}    ${TimeOut}
    wait until element is visible    ${Final_Text_Step_Pays}    ${TimeOut}
    wait until element is visible    ${Input_sđt}
    input text    ${Input_sđt}    0966543765
    scroll element into view    ${Note}
    input text    ${Note}    Giao tận cửa
    wait until element is visible    ${Message_error_address}
    wait until element is visible    ${Button_Pay_Disable}    ${TimeOut}
    scroll element into view    ${Button_Pay_Disable}
    click element    ${Logo}
    sleep    2s