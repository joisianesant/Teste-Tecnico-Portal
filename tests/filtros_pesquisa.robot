*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Suite Setup    Abrir site PCPDev
Suite Teardown    Fechar Navegador

*** Test Cases ***
CT-001 Buscar por termo no campo Objeto
    [Tags]    Gherkin
    Preencher campo Objeto    Licitação
    Clicar em Buscar
    Validar retorno da pesquisa

CT-002 Buscar por número do processo
    [Tags]    Gherkin
    Preencher campo Processo    123456
    Clicar em Buscar
    Validar retorno da pesquisa

CT-003 Buscar por nome do órgão comprador
    [Tags]    Gherkin
    Preencher campo Órgão    Prefeitura
    Clicar em Buscar
    Validar retorno da pesquisa
