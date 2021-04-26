***Settings***
Documentation       Ações da feature de gestão de planos

***Variables***
${TITLE_FIELD}      id=title
${DURATION_FIELD}   id=duration
${PRICE_FIELD}      css=input[name=price]
${TOTAL_FIELD}      css=input[name=total]

***Keywords***
## Forms
Submit Plan Form
    Click           xpath=//button[contains(text(), "Salvar")]

Fill Plan Form
    [Arguments]     ${plan}

    Fill Text       ${TITLE_FIELD}        ${plan.title}
    Fill Text       ${DURATION_FIELD}     ${plan.duration}
    Fill Text       ${PRICE_FIELD}        ${plan.price}

New Plan
    [Arguments]     ${plan}
  
    Fill Text       ${TITLE_FIELD}         ${plan.title}
    Fill Text       ${DURATION_FIELD}      ${plan.duration}
    Fill Text       ${PRICE_FIELD}         ${plan.price}

    Submit Plan Form  

Update a Plan
    [Arguments]     ${plan}
   
    #Log To Console   ${plan}
    Fill Text       ${TITLE_FIELD}         ${plan['title']}
    Fill Text       ${DURATION_FIELD}      ${plan['duration']}
    Fill Text       ${PRICE_FIELD}         ${plan['price']}

    Submit Plan Form  

## Links & Buttons
Go To Form Plan
    Click       css=a[href$="planos/new"]
    Wait For Elements State     css=h1 >> text=Novo plano     visible     5

Request Removal by Title 
    [Arguments]     ${title}
    Click           xpath=//td[contains(text(), "${title}")]/../td//button[@id="trash"]

Confirm Removal Plan
    Click           text=SIM, pode apagar!

Cancel Removal Plan
    Click           text=NÃO

Plan Should Be Visible
    [Arguments]                 ${title}

    Wait For Elements State     xpath=//td[contains(text(), "${title}")]    visible     5
    

Go To Plan Update Form
    [Arguments]                 ${title}

    Click                       xpath=//td[contains(text(), "${title}")]/..//a[@class="edit"]
    Wait For Elements State     css=h1 >> text=Edição de plano     visible         5 
    #Sleep                       1


## Validations
Total Plan Should Be
    [Arguments]     ${total}

    Get Attribute       ${TOTAL_FIELD}      value    ==    ${total}   
    
Request Removal By Plan 
    [Arguments]     ${plan}
    Click           xpath=//td[contains(text(), "${plan}")]/../td//button[@id="trash"]


Search Plan By Title
    [Arguments]         ${title}

    Fill Text           css=input[placeholder="Buscar plano"]           ${title} 

