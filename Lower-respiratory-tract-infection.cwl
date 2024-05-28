cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  lower-respiratory-tract-infection-lrti-bronchiolitis---primary:
    run: lower-respiratory-tract-infection-lrti-bronchiolitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  pneumococcal-lower-respiratory-tract-infection-lrti---primary:
    run: pneumococcal-lower-respiratory-tract-infection-lrti---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: lower-respiratory-tract-infection-lrti-bronchiolitis---primary/output
  lower-respiratory-tract-infection-lrti-tracheobronchitis---primary:
    run: lower-respiratory-tract-infection-lrti-tracheobronchitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: pneumococcal-lower-respiratory-tract-infection-lrti---primary/output
  purulent-lower-respiratory-tract-infection-lrti---primary:
    run: purulent-lower-respiratory-tract-infection-lrti---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: lower-respiratory-tract-infection-lrti-tracheobronchitis---primary/output
  respiratory---primary:
    run: respiratory---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: purulent-lower-respiratory-tract-infection-lrti---primary/output
  lower-respiratory-tract-infection-lrti-empyema---primary:
    run: lower-respiratory-tract-infection-lrti-empyema---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: respiratory---primary/output
  acute-lower-respiratory-tract-infection-lrti---primary:
    run: acute-lower-respiratory-tract-infection-lrti---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: lower-respiratory-tract-infection-lrti-empyema---primary/output
  lower-respiratory-tract-infection-lrti-chest---primary:
    run: lower-respiratory-tract-infection-lrti-chest---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: acute-lower-respiratory-tract-infection-lrti---primary/output
  lower-respiratory-tract-infection-lrti-bronchiectasis---primary:
    run: lower-respiratory-tract-infection-lrti-bronchiectasis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: lower-respiratory-tract-infection-lrti-chest---primary/output
  lower-respiratory-tract-infection-lrti-pleurisy---primary:
    run: lower-respiratory-tract-infection-lrti-pleurisy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: lower-respiratory-tract-infection-lrti-bronchiectasis---primary/output
  recurrent-lower-respiratory-tract-infection-lrti---primary:
    run: recurrent-lower-respiratory-tract-infection-lrti---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: lower-respiratory-tract-infection-lrti-pleurisy---primary/output
  resp---primary:
    run: resp---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: recurrent-lower-respiratory-tract-infection-lrti---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: resp---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
