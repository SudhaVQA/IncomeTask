@ignore
Feature: Get NUmber of Releases

  Scenario:
#    And karate.log('endpoint: '+endpoint)
    Given url endpoint
    And header Authorization = 'token ' + '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'
    When method GET
    Then status 200
   * def myFunLength =
    """
  function(arg){
  return arg.length
    }
    """
    * def output = call myFunLength response
#    And karate.log('Releases = ' +output);