import com.cwctravel.hudson.plugins.extended_choice_parameter.ExtendedChoiceParameterDefinition

def checkBox (String name, String values, String defaultValue,
              int visibleItemCnt=0, String description='', String delimiter=',') {

    // default same as number of values
    visibleItemCnt = visibleItemCnt ?: values.split(',').size()
    return new ExtendedChoiceParameterDefinition(
            name, //name,
            "PT_CHECKBOX", //type
            values, //value
            "", //projectName
            "", //propertyFile
            "", //groovyScript
            "", //groovyScriptFile
            "", //bindings
            "", //groovyClasspath
            "", //propertyKey
            defaultValue, //defaultValue
            "", //defaultPropertyFile
            "", //defaultGroovyScript
            "", //defaultGroovyScriptFile
            "", //defaultBindings
            "", //defaultGroovyClasspath
            "", //defaultPropertyKey
            "", //descriptionPropertyValue
            "", //descriptionPropertyFile
            "", //descriptionGroovyScript
            "", //descriptionGroovyScriptFile
            "", //descriptionBindings
            "", //descriptionGroovyClasspath
            "", //descriptionPropertyKey
            "", //javascriptFile
            "", //javascript
            false, //saveJSONParameterToFile
            false, //quoteValue
            visibleItemCnt, //visibleItemCount
            description, //description
            delimiter //multiSelectDelimiter
            )
}