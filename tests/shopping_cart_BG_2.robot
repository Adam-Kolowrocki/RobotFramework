*** Settings ***
Documentation    Automation test to add an item to shopping cart
Library          SeleniumLibrary


*** Variables ***
${POPUP_1}            //html/body/div[10]/div/button[2]
${POPUP_2}
${POPUP_3}
${CART_AMMOUNT}      //html/body/header/div[1]/div/div[4]/ul/li[2]/a/i[1]

*** Test Cases ***
Adding Product To Shopping Catr Should Increase Products Amount
    Prepare Env
    Open Shop Webpage
    Close Popups
    Check Shopping Cart Ammount
    Search Product
    Go To Product View
    Add Product To Shopping Cart
    Check If Shopping Cart Has 1 Product
#    [Teardown]    Close Browser


*** Keywords ***
Prepare Env
    Set Screenshot Directory    screanshots_2

Open Shop Webpage
    Open Browser      https://www.banggood.com/      firefox
    Maximize Browser Window


Close Popups
    Click Button      ${POPUP_1}


Check Shopping Cart Ammount