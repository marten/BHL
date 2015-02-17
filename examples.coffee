module.exports = [{
    label: 'Type'
    content: '''
                 We're only looking for certain types of illustrations.
                 '''
    
    figures: [{
      label: 'Drawing/painting/diagram'
      image: ""
      alt: "An example of a drawing"
    },{
      label: 'Chart/table'
      image: ""
      alt: "An example of a chart"
    },{
      label: "Photograph"
      image: ""
      alt: "An example of a photograph"
    },{
      label: "Map"
      image: ""
      alt: "An example of a map"
    }]
  },{
    label: "Keywords"
    content: '''
                  <p>Add general keywords or phrases about the primary species or subjects depicted in the  illustration Separate terms by semi-colons e.g. <b>bird; landscape; crab; forest; man; woman; apple; pottery; cemetery; skull; fossil; microscopic view; meteor, meteorological observations</b>.</p> 
                 <p>If it is a chart or table, indicate the topic that the data represents e.g. <b>Montana Wheat; Trout length; Livestock inventory; mirror</b></p>
                  <p>If is it a map, add any current or historic geographic locations indicated by the map or caption e.g. <b>Three Lakes; Southern China; Canada; Uriconium; Yorkshire</b></p>
                 '''
    figures: []
  },{
    label: "Tagging"
    content: '''
                 <p>Click on species, inscriptions and contributors in the illustration to record each one.</p>
                 '''
    figures: [{
      image: ""
      alt: "Species example"
      label: '''
                   <p>Species</p>
                   <p>Common Name=Ostrich
                   <br>
                   Scientific Name=Struthio camelus</p>
                   '''
      
      },{
        image: "examples/inscriptions.jpg"
        alt: "Handwritten inscription reading: Near Alata Sidaillo, Dec 15- 1926,Bycanistes cristatus"
        label: '''
                       <p>Inscriptions</p>
                       <ul>
                         <li>Near Alata Sidaillo</li>
                         <li>Dec 15- 1926-</li>
                         <li>Bycanistes cristatus</li>
                      </ul>
                       '''
        
      },{
        image: ""
        alt: "Contributors example"
        label: '''
                       <p>Contributors</p>
                       <ul>
                         <li>Name=Werner Klinkhardt   Role=Printer</li>
                         <li>Name=Sharp & Son    Role=Illustrator</li>
                       </ul>
                       '''
        
      }]
  }]
