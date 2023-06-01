function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
 
  }
  if (env == 'dev') {
    config.baseUrl = 'https://reqres.in';
    config.envPageNum = 2;
    config.envRegisterbody = read('../../resources\\dev\\requestBodyRegisterUser.json');

    // customize
    // e.g. config.foo = 'bar';
  } 
  if (env == 'staging') {
    config.baseUrl = 'https://reqres.in';
    config.envPageNum = 3;
    config.envRegisterbody = read('../../resources\\staging\\requestBodyRegisterUser.json');
   

    // customize
    // e.g. config.foo = 'bar';
  }
  else if (env == 'e2e') {

    // customize
  }
  return config;
}