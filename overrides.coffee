require './readymade/overrides.coffee'

SubjectViewer = require 'zooniverse-readymade/lib/subject-viewer'

SubjectViewer::template = require './templates/subject-viewer'

SubjectViewer::rescale = ()->
  scale = @markingSurface.el.parentNode.offsetWidth / @maxWidth
  @markingSurface.maxWidth = @maxWidth
  @markingSurface.maxHeight = @maxHeight
  @markingSurface.svg.attr
    width: scale * @maxWidth
    height: scale * @maxHeight

ClassifyPage = require 'zooniverse-readymade/lib/classify-page'

ClassifyPage::template = require './templates/classify-page'

currentProject = require 'zooniverse-readymade/current-project'
classify_page = currentProject.classifyPages[0]

{decisionTree, subjectViewer} = classify_page
  
ms = subjectViewer.markingSurface

# set the image scale if not already set  
ms.on 'marking-surface:add-tool', (tool) ->
  @rescale() if @scaleX is 0

LAST_TASK = false
INITIAL_STEPS = 2 # number of initial steps before annotating rectangles
ANNOTATION_STEPS = 2 # number of annotation steps per rectangle
MARGIN = 25 # margin on cropped images

current_tool = null

bhl_link = document.createElement 'a'
bhl_link.classList.add 'readymade-clickable'
bhl_link.setAttribute 'href', ''
bhl_link.setAttribute 'target', 'bhl'
bhl_link.innerHTML = '<span class="fa fa-file"></span> Original page'

drawing_controls = document.querySelector '.drawing-controls'
drawing_controls.appendChild bhl_link

# moving back and forward through the array of marked SVG rectangles
classify_page.el.on decisionTree.LOAD_TASK, ({originalEvent: detail: {task}})->
  rectangles = []
  
  for tool in ms.tools
    tool.deselect()
    tool.disable()
    rectangles.push tool if tool.mark._taskIndex is 1
    if tool.attr(subjectViewer.FROM_CURRENT_TASK) == 'true'
      tool.enable()
      tool.select()
  
  rect_index = parseInt (subjectViewer.taskIndex - INITIAL_STEPS) / ANNOTATION_STEPS
  
  if task.key in ['illustration', 'review']
    subjectViewer.rescale()
    ms.rescale 0, 0, subjectViewer.maxWidth, subjectViewer.maxHeight
  
  if task.key in ['details', 'parts'] and rectangles.length > 0
    current_tool = rectangles[rect_index]
    w = current_tool.mark.width + MARGIN * 2
    h = current_tool.mark.height + MARGIN * 2
    ms.rescale current_tool.mark.left - MARGIN, current_tool.mark.top - MARGIN, w, h
  
  if task.key is 'details'
    task.reset if current_tool.mark.details?
      details: current_tool.mark.details
  
  if task.key is 'details'
    LAST_TASK = rect_index == rectangles.length - 1
    if LAST_TASK
      task.next = 'review'
    else
      task.next = 'parts'

classify_page.el.on decisionTree.LOAD_TASK, ({originalEvent: detail: {task}})->
  task.reset 'yes' if task.key is 'illustrations'  

classify_page.el.on decisionTree.CHANGE, ({originalEvent: {detail}})->
  {key, value} = detail

  if decisionTree.currentTask.getNext()
    label = 'OK'
  else
    label = 'Finish'
  decisionTree.currentTask.confirmButton.innerHTML = label if label?
  
  if key is 'details'
    current_tool.mark.details = value.details

classify_page.on classify_page.LOAD_SUBJECT, (e, subject)->
  ms.rescale 0, 0, subjectViewer.maxWidth, subjectViewer.maxHeight
  
  bhl_link.setAttribute 'href', subject.metadata.bhl_url

ms.on 'marking-surface:add-tool', (tool) ->
  {label} = decisionTree.currentTask.getChoice() ? ''
  legend = tool.controls.el.querySelector 'legend'
  legend.innerText = label if legend?
