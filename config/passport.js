/*jshint latedef: false, strict: false, globalstrict: true, browser: true, jquery: true, node: true*/
var passport = require('passport'),
  LocalStrategy = require('passport-local').Strategy,
  bcrypt = require('bcrypt');

passport.serializeUser(function(user, done) {
  done(null, user[0].id);
});

passport.deserializeUser(function(id, done) {
  User.findById(id, function(err, user) {
    done(err, user);
  });
});

passport.use(new LocalStrategy( //authenticate ourselves
  function(username, password, done) {
    User.findByUsername(username,
      function(err, user) { //get the user by username and if he doesn't exist, raise a user error
        if (err) {
          return done(null, err);
        }
        if (!user || user.length < 1) {
          return done(null, false, {
            message: 'Incorrect username'
          });
        }
        bcrypt.compare(password, user[0].password, function(err, res) {
          if (!res) return done(null, false, {
            message: 'Invalid Password'
          });
          return done(null, user);
        });
      })
  }));

module.exports = {
  express: {
    customMiddleware: function(app) {
      console.log('express midleware for passport');
      app.use(passport.initialize());
      app.use(passport.session());
    }
  }
};
