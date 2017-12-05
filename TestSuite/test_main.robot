*** Settings ***
Documentation    Suite description

Library         Process
Library         BuiltIn
Library         SikuliLibrary  mode=NEW
Suite Setup     Start Sikuli Process    port=0
Suite Teardown  Terminate All Processes  kill=True

*** Variables ***
${IMAGE_DIR}      ${CURDIR}

*** Test Cases ***
Main Test
    [Tags]    Smoke test
    Open and close process
    Open dialog menu
    Add text into form
    Check result

*** Keywords ***
Open and close process
    Add Image Path   ${IMAGE_DIR}
    Double Click  find_button.jpg
    Input text  find_string.jpg  cmd
    Click  cmd.jpg
    Input text  cmd_input.jpg  cd  C:\Users\днс\Desktop\Моделирование систем\TestProg\TestSuite
    Press special key  ENTER
    Input text  python Main_form.py

Open dialog menu
    ${score} =	Get Match Score	 Script.jpg
    Run Keyword if	${score} > 0.7	 Click  Script.jpg

Add text into form
    ${score} =	Get Match Score	 String.jpg
    Run Keyword if	${score} > 0.7	 Input Text  String.jpg  hjgkj rtyfdfg
    Click   Press_Ok.jpg

Check result
    ${score} =	Get Match Score	 No.jpg
    Set Ocr Text Read  true
    Run Keyword if	${score} > 0.7	 ${result} = Get Text  No.jpg
    should be equal  no  ${result}
    Click  Exit_button.jpg





