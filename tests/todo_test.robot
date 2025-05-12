*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://abhigyank.github.io/To-Do-List/
${Task1}    Buy Milk
${Task2}    Walk Dog
${addTask_focus}    xpath=//*[@id="add-item"]/div
${addTask_input}    xpath=//*[@id="new-task"]
${addTask_button}    xpath=//*[@id="add-item"]/button
${todo_Tab}    xpath=/html/body/div/div/div[1]
${completed_Tab}    xpath=/html/body/div/div/div[1]/a[3]
${delete_button}    xpath=/html/body/div/div/div[3]/ul/li/button

*** Test Cases ***
Add Task And Complete It
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Focus To Element   ${addTask_focus}
    Input Text   ${addTask_input}   ${Task1}
    Click Button    ${addTask_button}
    Click Element    ${todo_Tab}
    Page Should Contain Element    xpath=//*[@id="text-1"]    ${Task1}    #Verify if task has been added
    Click Element   xpath=//*[@id="incomplete-tasks"]/li/label/span[4]    #Click on the checkbox to mark the task as completed
    Click Element    ${completed_Tab}
    Page Should Contain Element    xpath=//*[@id="completed-tasks"]/li   ${Task1}    #Verify if task has been completed
    Close Browser

#Delete Task From To-Do List
TC02
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Focus To Element   ${addTask_focus}
    Input Text    ${addTask_input}  ${Task2}
    Click Element    ${addTask_button}
    Click Element    ${todo_Tab}
    Page Should Contain Element    xpath=//*[@id="text-1"]  ${Task2}    #Verify if task has been added
    Set Focus To Element   xpath=//*[@id="incomplete-tasks"]/li/label
    Click Element   ${delete_button}    #Click on the delete button to remove the task
    Page Should Not Contain    ${Task2}    #Verify if task has been deleted
    Close Browser
