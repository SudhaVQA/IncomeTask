Feature: UI test

  Background:
    * configure driver = { type: 'chrome', executable: 'C:/Program Files/Google/Chrome/Application/chrome.exe', headless: true  }
    * configure ssl = true

  Scenario Outline: Test Task2
      Given driver 'https://github.com/'
      And driver.maximize()
      And waitFor("//input[@aria-label='Search GitHub']")
      And input("//input[@aria-label='Search GitHub']",'<GitHubUser>')

#    And click("//input[@aria-label='Search GitHub']")
#    And waitFor("//*[@id='jump-to-suggestion-search-global']/a")
#      And click(Key.ENTER)

   *  if ( exists ("//input[@aria-label='Search GitHub']")) click("//input[@aria-label='Search GitHub']")
    *  if ( exists ("//*[@id='jump-to-suggestion-search-global']/a")) waitFor("//*[@id='jump-to-suggestion-search-global']/a")
    *  if ( exists ("//*[@id='jump-to-suggestion-search-global']/a")) click("//*[@id='jump-to-suggestion-search-global']/a")
    Given driver 'https://github.com/search?q='+'<GitHubUser>'
#    And waitFor("//*[@id='jump-to-suggestion-search-global']/a")
#   And click("//*[@id='jump-to-suggestion-search-global']/a")
#      And click("//div//span[contains(text(),'All GitHub')]")
    * delay(3000)
    * if (exists ('//ul/li[1]/div[2]/div[1]/div/a')) click('//ul/li[1]/div[2]/div[1]/div/a')
#    * if (!('//ul/li[1]/div[2]/div[1]/div/a'))
    * def userName = script("//*[@id='repository-container-header']//span[1]/a",'_.innerHTML')
    And karate.log('userName is: '+userName)
    * def repoName = script("//*[@id='repository-container-header']/div[1]//strong/a",'_.innerHTML')
    And karate.log('RepoName is: '+repoName)
    * if (exists("//*[@id='repo-stars-counter-star']")) var StarsFromUI = script("//*[@id='repo-stars-counter-star']",'_.innerHTML')
#   * integer iStarsFromUI = parseInt(parseInt)
    And karate.log('StarsFromUI is: '+StarsFromUI)
#  https://api.github.com/repos/zavg/linux-0.01
    * def base = 'https://api.github.com/repos/'
    * string repoURL = base + userName + "/" + repoName
    Given url repoURL
    When method GET
    Then status 200
    * def data = response
    * string StarsFromAPI = response.stargazers_count
#  * DecimalFormat df = new DecimalFormat("#.#####");
#    * integer iStarsFromAPI = parseInt(StarsFromAPI)
    And karate.log('StarsFromAPI is: '+StarsFromAPI)
#    And karate.log('StarsFromAPI is: '+df.StarsFromAPI)
#    * match StarsFromUI == df.StarsFromAPI
    And karate.log('Matching StarsFromUI:'+StarsFromUI+' with StarsFromAPI:'+StarsFromAPI)
    * match StarsFromUI == StarsFromAPI


      Examples:
        |GitHubUser|
        | torvalds          |
#        | defunkt         |
#        | udacity                 |

