*** Settings ***
Documentation  Automated tests for shopping cart functionality
Library        SeleniumLibrary


*** Variables ***
${CART_ITEMS_AMOUNT}    //header/div[2]/div[1]/a[1]
${PRODUCT_CLICK}        //body/div[1]/div[4]/div[1]/div[1]/div[1]/div[1]/div[2]/div[3]/a[1]/span[1]/img[1]
${PRODUCT_CLICK_2}      //body[1]/div[1]/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/div[1]/div[2]/div[2]/div[1]/form[1]/fieldset[1]/div[2]/button[1]/span[1]
${SECOND_CART_CHECH}    //body[1]/div[1]/header[1]/div[2]/div[1]/a[1]/span[1]/b[1]/b[2]/span[1]

*** Test Cases ***
Adding Product To Shopping Catr Should Increase Products Amount
    Prepare Env
    [Setup]         Open Shop Webpage
#    Check If Shopping Cart Is Empty
    Go To Product View
    Add Product To Shopping Cart
    Check If Shopping Cart Has 1 Product
#     [Teardown]    Close Browser

*** Keywords ***
Prepare Env
    Set Selenium Speed    0.5
    Set Screenshot Directory    screanshots

Open Shop Webpage
    Open Browser     https://znowodronach.pl/    chrome
    Maximize Browser Window

Check If Shopping Cart Is Empty
    Wait Until Element Contains        ${CART_ITEMS_AMOUNT}    0

Go To Product View
    Click Element                 ${PRODUCT_CLICK}

Add Product To Shopping Cart
    Click Element                 ${PRODUCT_CLICK_2}

Check If Shopping Cart Has 1 Product
    Element Text Should Be         ${SECOND_CART_CHECH}        1
