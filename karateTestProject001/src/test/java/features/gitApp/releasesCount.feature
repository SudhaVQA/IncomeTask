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