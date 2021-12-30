Feature: sample karate test script

  Background:
    Given url urlGetUsersAPI
    And header Authorization = 'token ' + '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'
#    And karate.log('base URL is.. -->' +urlGetUsersAPI);

  Scenario Outline: Get all users and then get the first user by id

    And string endpoint = '<GitHubUser>'
#    And karate.log('endpoint URI is.. -->' +endpoint);
    Given path endpoint
    When method GET
    Then status 200
    * string apiResponse = response
#    And karate.log('apiResponse is.. -->' +apiResponse);
    * def Username = response.login
    * def Name = response.name
    * string CreatedOn = response.created_at
    * def repoLength = response.public_repos
    * def userInfo = '\nUser Information: \nUsername = ' +Username +'\nName = ' +Name+'\nCreated on = ' +CreatedOn.substring(0, 10)
    And karate.log(userInfo);
#    And karate.log('Name = ' +Name);
#    And karate.log('Created on = ' +CreatedOn.substring(0, 10));
    * string repoURL = response.repos_url + '?type=owner'
#    And karate.log('RepoURL = ' +repoURL);
   Given url repoURL
    When method GET
    Then status 200
    * string data = response
#    And karate.log('data = ' +data);
    * def myFun =
    """
  function(arg){
  var nameList = []
  var starCount = 0
  var finalOutput = []
  var releases = []
  var owner  = ''
  var repo = ''
  var url = []
  var releaseCount = []
    for(i=0; i<arg.length; i++){
    j=i+1;
    owner = arg[i].owner.login
    repo = arg[i].name
  nameList[i] ="\nRepository"+ j + " = " + arg[i].name
  starCount = "\n     Stars = " + arg[i].stargazers_count
  url[i] = 'https://api.github.com/repos/'+owner+'/'+repo + '/releases'
  var endpoint = url[i];
  var result = karate.call('releasesCount.feature', {endpoint : "https://api.github.com/repos/"+owner+"/"+repo + "/releases"})
  releases =  "\n     ReleaseURL = " + url[i]
   releaseCount =  "\n     Releases = " + result.output
  finalOutput[i] = nameList[i] + starCount + releases + releaseCount
  }
    return finalOutput
  }
    """
    * def output = call myFun response
    And karate.log('\nRepository Information:' +output);

    Examples:
    |GitHubUser|
    | torvalds         |
    | defunkt                |



  