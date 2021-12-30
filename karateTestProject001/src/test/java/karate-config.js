function fn() {

  var config = {
    urlGetUsersAPI: 'https://api.github.com/users/',
      GitHubUser: karate.properties['karate.GitHubUser'] || 'torvalds'
  }

  return config;
}