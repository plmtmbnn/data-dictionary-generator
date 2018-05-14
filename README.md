# data-dictionary-generator
Hola!

This is a JavaFX project for generate BPMN XML form into Data Dictionary JSON form.

Tool will read tag datastores and dataobject that found in BPMN.
User can create each data object or data store into Data Dictionary.

Features:
  * Reading XML BPMN (modeled in Bizagi tool)
  * Getting list of data object and data store
  * Getting actor, activity, process name base on data object or data store
  * Generate data object or data store into JSON file
  * Getting attribue of each data
  * Able to add and complete attributes each data
  * Automatic read attributes that stored before
  * All data store in database
  
Database schema: 
  - datadictionary 
  - attribute
  - datadictinary_attribute
