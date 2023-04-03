*** Settings ***
Library    SeleniumLibrary
Variables    ../vendorSuite.py

*** Keywords ***
go to dashboardPage
    Create Webdriver    ${Browser} 
    Go To   ${baseUrl}
    Maximize Browser Window