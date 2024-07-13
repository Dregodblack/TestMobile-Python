*** Settings ***
Documentation        Aqui estam presentes os registros das aulas automatizadas 
...                  com o robot Framework

*** Variables ***
#Simples
${NOME}    Andre Luis

#Dicionário
&{PESSOA}    
...        nome=Andre
...        sobrenome=Luis
...        idade=21
...        email=email@gmail.com
...        dataNascimento=21/10/1998
...        RG=21 263.282-2

#Lista
@{FRUTAS}    Create List    Banana    Uva    Pera    Maçã

*** Test Cases ***
Cenário: Imprimir informações
    Log To Console    \n${PESSOA.nome}
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.email}
    Log To Console    ${PESSOA.dataNascimento}
    Log To Console    ${PESSOA.RG}

Cenário: Imprimir Frutas
    [Tags]          LISTA
    Log To Console    \n${FRUTAS[0]}
    Log To Console    ${FRUTAS[1]}
    Log To Console    ${FRUTAS[2]}

Cenário: Somar dois valores
    [Tags]    SOMA
    # Somar dois numeros    10    10
    Somar dois numeros "12" e "12"


*** Keywords ***
Somar dois numeros "${NUM_A}" e "${NUM_B}"
    # [Arguments]    ${NUM_A}    ${NUM_B}
    ${SOMA}        Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    ${SOMA}
