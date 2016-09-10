var config = {};

config.LOCAL = {};
config.TEST = {};
config.PROD = {};

config.ENV_LOCAL = 'LOCAL';
config.ENV_TEST = 'TEST';
config.ENV_PROD = 'PROD';


// **** Heroku Config vars ****
config.port = process.env.PORT || 8080;
config.env = process.env.ENV || 'LOCAL';

config.LOCAL.use_ssl = false;
config.TEST.use_ssl = true;
config.PROD.use_ssl = true;
config.use_ssl = config[config.env]['use_ssl'];

module.exports = config;
