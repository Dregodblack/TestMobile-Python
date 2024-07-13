*** Settings ***
Documentation            Aqui estão presentes os cenários e keywords que dizem a respeito sobre
...                      a Automação Mobile

Library                  AppiumLibrary
Test Setup               Abrir aplicativo
Test Teardown            Fechar aplicativo

# python -m robot Tests/MobileAutomation.robot

*** Keywords ***
Abrir aplicativo
    Set Appium Timeout                60
    Open Application                  http://localhost:4723/wd/hub
    ...                               automationName=uiautomator2
    ...                               deviceName=ZY3224F3S3
    ...                               platformName=Android
    ...                               autoGrantPermissions=true
    ...                               appPackage=com.google.android.youtube
    ...                               appActivity=com.google.android.youtube.HomeActivity

Fechar aplicativo
    Close Application

Dado que o cliente esteja na tela de Home
    Wait Until Element Is Visible                id=youtube_logo
    Element Attribute Should Match               xpath=//android.widget.Button[@content-desc="Início"]/android.widget.ImageView           selected        True             

Quando pesquiso um vídeo sobre "${BUSCA}"
    Click Element                                accessibility_id=Pesquisar
    Input Text                                   id=search_edit_text                ${BUSCA}
    Press Keycode                                66

E acesso o canal da Prime
    Wait Until Element Is Visible                accessibility_id=Prime Experts - Parceria entre Prime Control e UniBrasil - 3 minutos e 38 segundos - Ir ao canal - Prime Control - 203 visualizações - há 1 ano - assistir o vídeo
    Click Element                                xpath=//android.view.ViewGroup[@content-desc="Prime Experts - Parceria entre Prime Control e UniBrasil - 3 minutos e 38 segundos - Ir ao canal - Prime Control - 203 visualizações - há 1 ano - assistir o vídeo"]/child::*[@content-desc='Ir ao canal']

E clico em Inscrever-se
    Wait Until Element Is Visible                accessibility_id=Inscreva-se em Prime Control.
    Click Element                                accessibility_id=Inscreva-se em Prime Control.

Então será apresentado como Inscrito
    Wait Until Element Is Visible                accessibility_id=Cancelar inscrição de Prime Control.

*** Test Cases ***
CT01: Teste Mobile
    Dado que o cliente esteja na tela de Home
    Quando pesquiso um vídeo sobre "Prime Experts"
    E acesso o canal da Prime
    E clico em Inscrever-se
    Então será apresentado como Inscrito

