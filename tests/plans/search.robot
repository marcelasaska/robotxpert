***Settings***
Documentation       Buscar Planos

Resource        ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenário: Consultar Plano cadastrado

    &{plan}     Create Dictionary       title=Plano Completo      duration=1     price=159.99     total=R$ 159,99

    Remove Plan                 ${plan.title}
    Insert Plan                 ${plan}
    Go To Plans
    Search Plan By Title        ${plan.title}
    Plan Should Be Visible      ${plan.title}
    Total Items Should Be       1


Cenário: Registro não encontrado
    [tags]          search
    ${title}        Set Variable        Plano zero

    Remove Plan             ${title} 
    Go To Plans
    Search Plan By Title    ${title}   
    Register Should Not Be found 