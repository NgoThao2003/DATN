*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Resource    ../Resource/Search.resource
Resource    ../Resource/ShoppingCardManagement.resource
Suite Setup    Open Browwer And Login

*** Variables ***
${Button_Pay}    //button//p[contains(text(), 'Thanh toán')]
${Button_Pay_Disable}    //button[@class='Button_wrapper__GqKsN Button_primary__9MLUH Button_disabled__DkgJ+ Button_order__t1Yc1']
${Final_Text_Step_Pays}    //h1[contains(text(), 'Bước cuối cùng - Thanh toán')]
${Building}    //div//span[contains(text(), 'Tòa nhà')]
${Building_A7}    //ul//li[contains(text(), 'Tòa A7')]
${Button_Order}     //button//p[contains(text(), 'Đặt đơn')]
${Button_Đơn_Mua}    (//button//p[contains(text(),'Đơn mua')])[2]
${Slect_Floor}    //div//span[contains(text(), 'Tầng')]
${Slect_A7_Floor}    //ul//li[contains(text(), 'Tầng 2')]
${Classroom}    //div//span[contains(text(), 'Phòng học')]
${Classrom_201}    //ul//li[contains(text(), 'Phòng 201')]
${Note}    //input[@placeholder='Hãy gọi điện trước cho tôi']
${Message_order_create_success}    //div[contains(text(), 'Tạo mới đơn đặt hàng thành công')]
${Icon_loading}    //div[@class='modal-loading__content']
${Pay_By_E_Wallet}    //div//label//span[contains(text(), 'Thanh toán bằng Ví Điện Tử HaUIFood')]
${Logo}    //a//img[@class='Header_header__logo__dVBeT']
*** Keywords ***
Buy Product
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    wait until element is visible    ${Card_product_detail}    5s
    click element    ${Button_Pay}
    wait until element is not visible    ${Icon_loading}    ${TimeOut}
    wait until element is visible    ${Final_Text_Step_Pays}    ${TimeOut}
    click element    ${Building}
    wait until element is visible    ${Building_A7}    ${TimeOut}
    click element    ${Building_A7}
    click element    ${Slect_Floor}
    wait until element is visible    ${Slect_A7_Floor}    ${TimeOut}
    click element    ${Slect_A7_Floor}
    click element    ${Classroom}
    wait until element is visible    ${Classrom_201}    ${TimeOut}
    click element    ${Classrom_201}
    scroll element into view    ${Note}
    input text    ${Note}    0359234732

Message Pay successful And Go To Home Page
    wait until element is visible    ${Message_order_create_success}    ${TimeOut}
    wait until element is visible    ${Button_Đơn_Mua}    ${TimeOut}
    wait until element is not visible    ${Icon_loading}     ${TimeOut}
    click element    ${Logo}
    sleep    2s

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

Purchase successful without entering notes
    Product add card
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    wait until element is visible    ${Card_product_detail}    5s
    click element    ${Button_Pay}
    wait until element is not visible    ${Icon_loading}    ${TimeOut}
    wait until element is visible    ${Final_Text_Step_Pays}    ${TimeOut}
    click element    ${Building}
    wait until element is visible    ${Building_A7}    ${TimeOut}
    click element    ${Building_A7}
    click element    ${Slect_Floor}
    wait until element is visible    ${Slect_A7_Floor}    ${TimeOut}
    click element    ${Slect_A7_Floor}
    click element    ${Classroom}
    wait until element is visible    ${Classrom_201}    ${TimeOut}
    click element    ${Classrom_201}
    scroll element into view    ${Button_Order}
    click element    ${Button_Order}
    Message Pay successful And Go To Home Page


Purchase failed when building address was not entered
    Product add card
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    wait until element is visible    ${Card_product_detail}    5s
    click element    ${Button_Pay}
    wait until element is not visible    ${Icon_loading}    ${TimeOut}
    wait until element is visible    ${Final_Text_Step_Pays}    ${TimeOut}
    scroll element into view    ${Note}
    input text    ${Note}    0359234732
    wait until element is visible    ${Button_Pay_Disable}    ${TimeOut}
    scroll element into view    ${Button_Pay_Disable}
    click element    ${Logo}
    sleep    2s

Purchase failed without selecting a floor
    Product add card
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    wait until element is visible    ${Card_product_detail}    5s
    click element    ${Button_Pay}
    wait until element is not visible    ${Icon_loading}    ${TimeOut}
    wait until element is visible    ${Final_Text_Step_Pays}    ${TimeOut}
    click element    ${Building}
    wait until element is visible    ${Building_A7}    ${TimeOut}
    click element    ${Building_A7}
    scroll element into view    ${Note}
    input text    ${Note}    0359234732
    wait until element is visible    ${Button_Pay_Disable}    ${TimeOut}
    scroll element into view    ${Button_Pay_Disable}
    click element    ${Logo}
    sleep    2s







