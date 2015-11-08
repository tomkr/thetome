window.fbAsyncInit = function() {
  FB.init({
    appId      : '546946902125383',
    xfbml      : true,
    version    : 'v2.5'
  });

  let byId = function(id) {
    return document.getElementById(id);
  };
  let UI = byId('fb-login-status');

  let logginginUI = byId('fb-logging-in');
  let loginButton = byId('fb-login');

  let loggedinUI = byId('fb-logged-in');
  let loggedinName = byId('fb-logged-name');

  let showConnection = function() {
    FB.api('/me', function(response) {
      loggedinName.html(response.name);
    });
  };

  let hide = function(element) {
    element.classList.add('is-hidden');
  }

  let show = function(element) {
    element.classList.remove('is-hidden');
  }

  let login = function(event) {
    FB.login(function(response) {
      hide(logginginUI);
      showConnection();
      show(loggedinUI);
    });
  }

  FB.getLoginStatus(function(response) {
    let status = response.status;
    if (response.status === 'connected') {
      show(loggedinUI);
      logoutButton.addEventListener('click', logout);
    } else {
      show(logginginUI);
      loginButton.addEventListener('click', login);
    };
  });
};
