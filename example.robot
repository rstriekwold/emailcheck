*** Settings ***

Documentation           New test suite
Library                 QWeb
Library                 MailLib.py    ${tenant_id}    ${client_id}    ${client_secret}
Library                 String
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***
Try it out
    ${messages}=    get_last_mail      Copado.Tester1@email.com
    ${messages2}=   get_all_mail       Copado.Tester1@email.com
    ${links}=      get_mail_links     Copado.Tester1@email.com
    send_mail_message          Copado.Tester1@email.com  CRT Robot     Copado.Tester1@email.com   Copado Tester1   CRT Send Mail     Body text with link <a href\="https://www.google.com">google</a> and more
    Log to Console            ${messages}
    Log to Console            ${messages2}
    Log to Console            ${links}
