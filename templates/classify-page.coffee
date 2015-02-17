translate = require 'zooniverse/lib/translate'

module.exports = -> """
  <div class="readymade-classification-interface">
    <div class="readymade-no-more-subjects-message" style="display: none;">
      <p>Looks like we\'re temporarily out of data to classify. Please check back later!</p>
      <p>In the meantime, <a href="https://www.zooniverse.org/">check out some other projects in the Zooniverse!</a></p>
    </div>
    <div class="readymade-subject-viewer-container">
      <h2 class="group-title"></h2>
    </div>
    <div class="fixed-panel">
      <div class="readymade-decision-tree-container"></div>
      <div class="readymade-summary-container" style="display: none;"></div>
      <div class="drawing-controls">
        <label class="readymade-has-clickable" title="Help">
          <input type="checkbox" name="help" />
          <span class="readymade-clickable small">
            <i class="fa fa-question readymade-clickable-not-checked"></i>
            <i class="fa fa-question readymade-clickable-checked" style="color: lightslategrey;"></i>
            <span>Help</span>
          </span>
        </label>
        
        <label class="readymade-has-clickable" title="Favourite">
          <input type="checkbox" name="favorite" />
          <span class="readymade-clickable small">
            <i class="fa fa-heart-o readymade-clickable-not-checked"></i>
            <i class="fa fa-heart readymade-clickable-checked" style="color: lightslategrey;"></i>
            <span>#{translate 'readymade.favorite'}</span>
          </span>
        </label>
        
        <label class="readymade-has-clickable" title="Toggle full page">
          <input type="checkbox" name="pagezoom" />
          <span class="readymade-clickable small">
            <i class="fa fa-search-plus readymade-clickable-not-checked"></i>
            <i class="fa fa-search-plus readymade-clickable-checked" style="color: lightslategrey;"></i>
            <span>Toggle full page</span>
          </span>
        </label>
        
        <button name="restart-tutorial" title="Tutorial">
          <span class="readymade-clickable small">
            #{translate 'readymade.tutorialIcon'}
            <span>#{translate 'readymade.restartTutorial'}</span>
          </span>
        </button>
        
        <a href="" target="bhl" class="readymade-clickable small" title="Original page">
          <span class="fa fa-file"></span>
          Original page
        </a>
      </div>
    </div>
  </div>
  <div class="readymade-field-guide-container" aria-hidden="false"></div>
"""
