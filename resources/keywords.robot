*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://www.pcpdev.com.br
${CAMPO_OBJETO}        xpath=//*[@id="objeto"]     
${CAMPO_PROCESSO}      xpath=//*[@id="processo"]
${CAMPO_ORGAO}         xpath=//*[@id="orgao"]
${BOTAO_BUSCAR}        xpath=//*[@id="pesquisa-p"]/a[1]

*** Keywords ***
Abrir site PCPDev
    [Documentation]    Abre o site no Chrome e maximiza a janela
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//body    15s   # espera a página carregar totalmente
    Sleep    1s   # garante scripts JS carregarem

Preencher campo Objeto
    [Arguments]    ${texto}
    Wait Until Element Is Visible    ${CAMPO_OBJETO}    10s
    Scroll Element Into View         ${CAMPO_OBJETO}
    Clear Element Text               ${CAMPO_OBJETO}
    Input Text                       ${CAMPO_OBJETO}    ${texto}

Preencher campo Processo
    [Arguments]    ${numero}
    Wait Until Element Is Visible    ${CAMPO_PROCESSO}    10s
    Scroll Element Into View         ${CAMPO_PROCESSO}
    Clear Element Text               ${CAMPO_PROCESSO}
    Input Text                       ${CAMPO_PROCESSO}    ${numero}

Preencher campo Órgão
    [Arguments]    ${orgao}
    Wait Until Element Is Visible    ${CAMPO_ORGAO}    10s
    Scroll Element Into View         ${CAMPO_ORGAO}
    Clear Element Text               ${CAMPO_ORGAO}
    Input Text                       ${CAMPO_ORGAO}    ${orgao}

Clicar em Buscar
    Wait Until Element Is Visible    ${BOTAO_BUSCAR}    10s
    Scroll Element Into View         ${BOTAO_BUSCAR}
    Click Element                   ${BOTAO_BUSCAR}
    Sleep    2s  # aguarda resultados carregarem

Validar retorno da pesquisa
    Wait Until Page Does Not Contain    Buscando    10s

Fechar Navegador
    Close Browser
